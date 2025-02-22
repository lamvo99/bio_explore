// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/custom_widgets/app_image.dart';
import 'package:flutter/material.dart';

// Project imports:

class AppImageItem extends StatelessWidget {
  final File? file;
  final String? url;
  final Function() onTap;
  final bool isBorder;
  final bool isOnTap;

  const AppImageItem({
    super.key,
    this.file,
    this.url,
    required this.onTap,
    this.isBorder = true,
    this.isOnTap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          AppContainer(
            borderRadius: BorderRadius.circular(6),
            border: isBorder ? Border.all(color: AppColors.gray200) : null,
            child: AppImage(
              height: 120,
              width: 88,
              file: file,
              url: url,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Visibility(
            visible: isOnTap,
            child: Positioned(
              top: 4,
              right: 4,
              child: InkWell(
                onTap: onTap,
                child: const Icon(Icons.cancel_rounded,
                    size: 22, color: AppColors.primary600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
