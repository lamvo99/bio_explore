// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:bio_explore/shared_customization/widgets/custom_widgets/app_image.dart';
import 'package:flutter/material.dart';

// Project imports:
import '/app_common_data/app_colors.dart';
import '/shared_customization/enums/image_type.dart';

class AppImageButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final String? url;
  final String? assetUrl;
  final File? file;
  final BorderRadius? borderRadius;
  final BoxFit fit;
  final EdgeInsets imagePadding;
  final Color backgroundColor;
  final ImageType imageType;

  const AppImageButton({
    super.key,
    required this.onPressed,
    this.url,
    this.assetUrl,
    this.file,
    this.borderRadius,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.backgroundColor = AppColors.transparent,
    this.imagePadding = EdgeInsets.zero,
    this.imageType = ImageType.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AppImage(
        url: url,
        assetUrl: assetUrl,
        file: file,
        borderRadius: borderRadius,
        width: width,
        height: height,
        fit: fit,
        backgroundColor: backgroundColor,
        imagePadding: imagePadding,
        imageType: imageType,
      ),
    );
  }
}
