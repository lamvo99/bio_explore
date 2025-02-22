// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:bio_explore/generated/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// Project imports:
import '/shared_customization/helpers/dialogs/dialog_helper.dart';

class ImagePickerHelper {
  ImagePickerHelper._();

  static Future<List<File>> showImagePicker({
    required BuildContext context,
    bool withCameraOption = true,
    bool multiSelection = true,
    bool withVideoOption = false,
    List<File>? fileSelected,
  }) async {
    List<XFile>? data = [];

    if (!multiSelection) {
      XFile? image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);

      if (image != null) {
        data.add(image);
      }
    } else {
      if (withVideoOption) {
        List<XFile>? newData = await ImagePicker().pickMultipleMedia();
        data.addAll(newData);
      } else {
        List<XFile>? newData = await ImagePicker().pickMultiImage();
        data.addAll(newData);
      }
    }
    List<File> selectedFiles =
        (data == null) ? [] : data.map((xfile) => File(xfile.path)).toList();

    return selectedFiles;
  }

  static Future<File?> takePhotoFromCamera(
      {required BuildContext context}) async {
    PermissionStatus status = await Permission.camera.request();
    try {
      XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
      return xFile == null ? null : File(xFile.path);
    } on PlatformException {
      PermissionStatus status = await Permission.camera.request();
      if ([PermissionStatus.denied, PermissionStatus.permanentlyDenied]
          .contains(status)) {
        showConfirmDialog(context,
            title: i18n.Permission.CameraPermissionPurpose,
            content: i18n.Permission.PleaseAcceptCameraPermission,
            onAccept: openAppSettings);
        return null;
      }
    }
    return null;
  }
}
