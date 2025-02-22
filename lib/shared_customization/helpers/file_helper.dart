// ignore_for_file: use_build_context_synchronously

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/shared_customization/extensions/list_ext.dart';
import 'package:bio_explore/shared_customization/helpers/dialogs/dialog_helper.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:file_picker/file_picker.dart';

class FileHelper {
  FileHelper._();

  static Future getFile(
      {required BuildContext context,
      required bool allowMultiple,
      FileType type = FileType.any,
      List<String>? allowedExtensions}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: type,
          allowMultiple: allowMultiple,
          allowedExtensions:
              allowedExtensions.isNotEmptyOrNull ? allowedExtensions : null);
      if (result != null) {
        if (allowMultiple == false) {
          File fileReturn = File(result.files.single.path!);
          if (fileReturn.lengthSync() > 10000000) {
            showErrorDialog(context,
                title: i18n.CommonNotiAction.Failed,
                content: i18n.CommonValidation.FileSizeMustLessThan10MB);
            return null;
          } else {
            return fileReturn;
          }
        } else {
          List<File> fileReturn =
              result.files.map((e) => File(e.path!)).toList();
          if (fileReturn.any((element) => element.lengthSync() > 10000000)) {
            showErrorDialog(context,
                title: i18n.CommonNotiAction.Failed,
                content: i18n.CommonValidation
                    .ListFileHasOneOrMoreFileSizeBiggerThan10MB);
            fileReturn
                .removeWhere((element) => element.lengthSync() > 10000000);
            return fileReturn;
          } else {
            return fileReturn;
          }
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
