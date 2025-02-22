// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;

extension FileExt on File? {
  String get name =>
      this == null ? '' : this!.path.split(Platform.pathSeparator).last;

  Future<MultipartFile?> get toMultipartFile async {
    return this == null
        ? null
        : MultipartFile.fromFile(this!.path, filename: this!.path);
  }

  bool isImageFile(String filePath) {
    String extension = path.extension(filePath).toLowerCase();
    String? mimeType = lookupMimeType(filePath);

    if (mimeType != null && mimeType.startsWith('image')) {
      return true;
    }

    if (extension == '.jpg' ||
        extension == '.jpeg' ||
        extension == '.png' ||
        extension == '.gif' ||
        extension == '.bmp') {
      return true;
    }

    return false;
  }
}
