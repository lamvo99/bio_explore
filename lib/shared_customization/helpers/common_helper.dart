// ignore_for_file: depend_on_referenced_packages

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' show basename;
import 'package:path_provider/path_provider.dart';

// Project imports:
import '/shared_customization/extensions/string_ext.dart';

class CommonHelper {
  CommonHelper._();

  static Future<String> downloadExcelFile(String url, String name) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$name.xlsx');
      await file.writeAsBytes(response.bodyBytes);
      return file.path;
    } else {
      throw Exception('Failed to download Excel file');
    }
  }

  static Future<File> downloadFile(String url, String filename) async {
    String downloadDirectory = '';
    if (Platform.isAndroid) {
      final externalStorageFolder = await getExternalStorageDirectory();
      if (externalStorageFolder != null) {
        downloadDirectory = externalStorageFolder.path;
      }
    } else {
      final downloadFolder = await getApplicationDocumentsDirectory();
      downloadDirectory = downloadFolder.path;
    }

    http.Client client = http.Client();
    var req = await client.get(Uri.parse(url));
    var bytes = req.bodyBytes;

    File file = File('$downloadDirectory/$filename');

    await file.writeAsBytes(bytes);
    return file;
  }

  static Future<List<dio.MultipartFile>> processListFile(
      List<File> filesToProcess) async {
    List<dio.MultipartFile> processedFiles =
        await Future.wait(filesToProcess.map((file) async {
      String name = basename(file.path);
      Uri? parsedName = Uri.tryParse(name);
      String? imageNameDecoded = parsedName != null
          ? Uri.decodeFull(parsedName.toString()).trim()
          : name.trim();
      return await dio.MultipartFile.fromFile(
        file.path,
        filename: imageNameDecoded,
        contentType: file.path.isImage ? MediaType('image', 'jpg') : null,
      );
    }).toList());
    return processedFiles;
  }

  static Future<File> getFileFromLink(String url, [String? fileName]) async {
    var res = await http.Client().get(Uri.parse(url));
    final directory = await getApplicationCacheDirectory();
    if (!directory.existsSync()) {
      await directory.create();
    }
    File file = File('${directory.path}/${fileName ?? url.urlFileName}');
    await file.writeAsBytes(res.bodyBytes);
    return file;
  }

  static Future<File> getThumbnail(File file, {int width = 250}) async {
    try {
      // Get the application's cache directory
      final directory = await getApplicationCacheDirectory();

      // Generate the new file path for the thumbnail
      final newFilePath =
          '${directory.path}/thumbnail__${file.path.urlFileName.replaceAll(file.path.fileExtension, 'jpeg')}';

      // Read the image file and decode it
      final originalImage = img.decodeImage(file.readAsBytesSync());

      if (originalImage == null) {
        throw Exception('Failed to decode image');
      }

      // Resize the image to the desired width
      final resizedImage = img.copyResize(originalImage, width: width);

      // Encode the resized image to JPEG
      final jpegImage = img.encodeJpg(resizedImage);

      // Write the JPEG image to the new file path
      final newFile = File(newFilePath);
      await newFile.writeAsBytes(jpegImage);

      return newFile;
    } catch (err) {
      debugPrint('Convert image error: $err');
      // If an error occurs, return the original file
      return file;
    }
  }
}
