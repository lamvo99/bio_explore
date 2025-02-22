// Dart imports:
import 'dart:io';
import 'dart:math';

// Flutter imports:
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/shared_customization/enums/image_type.dart';
import 'package:bio_explore/shared_customization/extensions/string_ext.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/custom_widgets/base_cache_manager.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

// Project imports:
import '/app_common_data/app_colors.dart';
import '/app_common_data/common_data/global_variable.dart';

class AppImage extends StatelessWidget {
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
  final bool isBorder;
  final Widget? Function(File file)? fileBuilder;
  final Widget? Function(String url)? urlBuilder;

  const AppImage({
    super.key,
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
    this.isBorder = false,
    this.fileBuilder,
    this.urlBuilder,
  });

  const AppImage.avatar({
    super.key,
    this.url,
    this.assetUrl,
    this.file,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.backgroundColor = AppColors.transparent,
    this.imagePadding = EdgeInsets.zero,
    this.isBorder = false,
    required double size,
    this.fileBuilder,
    this.urlBuilder,
  })  : imageType = ImageType.avatar,
        width = size,
        height = size;
  void _checkMemory() {
    ImageCache imageCache = PaintingBinding.instance.imageCache;
    // print(_imageCache.currentSize);
    if (imageCache.currentSizeBytes >= 10 << 50 ||
        imageCache.currentSize >= 1024) {
      imageCache.clear();
      imageCache.clearLiveImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkMemory();
    return Container(
      padding: EdgeInsets.all(isBorder ? 2 : 0),
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius:
            borderRadius ?? BorderRadius.circular(BORDER_RADIUS_VALUE),
        child: Container(
          decoration: BoxDecoration(color: backgroundColor),
          padding: imagePadding,
          child: LayoutBuilder(
            builder: (context, constraint) {
              final widgetWidth = (constraint.maxWidth *
                      MediaQuery.of(context).devicePixelRatio)
                  .round();

              // print(width);
              final memCacheWidth = width != null
                  ? max(widgetWidth, width!.toInt())
                  : widgetWidth;
              if (file != null) {
                return fileBuilder?.call(file!) ??
                    Image.file(
                      file!,
                      fit: fit,
                    );
              } else if (url.isNotEmptyOrNull) {
                return IntrinsicWidth(
                  child: urlBuilder?.call(url!) ??
                      CachedNetworkImage(
                        imageUrl: url!,
                        fit: fit,
                        cacheManager: CustomCacheManager(),
                        memCacheWidth: memCacheWidth.round(),
                        maxHeightDiskCache: 2160,
                        maxWidthDiskCache: 2160,
                        placeholder: (context, url) => imageLoading,
                        errorWidget: (context, url, error) => imageLoading,
                        fadeOutDuration: const Duration(milliseconds: 500),
                        fadeInDuration: const Duration(milliseconds: 200),
                      ),
                );
              } else if (assetUrl.isNotEmptyOrNull) {
                return Image.asset(
                  assetUrl!,
                  fit: fit,
                );
              }
              return imagePlaceHolder;
            },
          ),
        ),
      ),
    );
  }

  Widget get imagePlaceHolder => LayoutBuilder(
        builder: (context, constraint) {
          return AppContainer(
            color: AppColors.gray50,
            padding: EdgeInsets.all(
                min(12.0, min(constraint.maxHeight, constraint.maxWidth) / 4)),
            child: Center(
              child: imageType.imagePlaceHolder,
            ),
          );
        },
      );

  Widget get imageLoading => LayoutBuilder(
        builder: (context, constraint) {
          return AppContainer(
            color: AppColors.gray50,
            padding: EdgeInsets.all(
                min(12.0, min(constraint.maxHeight, constraint.maxWidth) / 4)),
            child: Center(
              child: Assets.images.imageLoading.image(),
            ),
          );
        },
      );

  Widget get avatarLoading => LayoutBuilder(
        builder: (context, constraint) {
          return AppContainer(
            color: AppColors.gray200,
            padding: EdgeInsets.all(
                min(12.0, min(constraint.maxHeight, constraint.maxWidth) / 4)),
            child: Center(
              child: Assets.icons.icAvatar.svg(),
            ),
          );
        },
      );
}