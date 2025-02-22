// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:bio_explore/shared_customization/helpers/common_helper.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// Project imports:

class CustomCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static CustomCacheManager? _instance;

  factory CustomCacheManager() {
    _instance ??= CustomCacheManager._internal();
    return _instance!;
  }
  CustomCacheManager._internal()
      : super(
          Config(
            key,
            stalePeriod: const Duration(days: 7), // Keep files for 7 days
            maxNrOfCacheObjects: 100,
            repo: JsonCacheInfoRepository(databaseName: key),
            fileSystem: IOFileSystem(key),
            fileService: HttpFileService(),
          ),
        );
  Future<File?> getFileData(String url, {bool isThumbnail = true}) async {
    try {
      String thumbnailUrl = 'thumbnail_$url';
      if (isThumbnail) {
        // Attempt to retrieve the thumbnail from cache
        FileInfo? thumbnailFile = await getFileFromCache(thumbnailUrl);
        if (thumbnailFile == null) {
          var originalFile = await CommonHelper.getFileFromLink(url);
          var thumbnailFile = await CommonHelper.getThumbnail(originalFile);
          _instance!.putFile(thumbnailUrl, thumbnailFile.readAsBytesSync());
          return thumbnailFile;
        } else {
          return thumbnailFile.file;
        }
      } else {
        // Retrieve the original file directly
        return await getSingleFile(url);
      }
    } catch (err) {
      debugPrint('Cache manager get file error: $err');
      return null;
    }
  }
}
