// Flutter imports:
import 'package:bio_explore/model/files/files.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../app_container.dart';
import '../texts/app_text.dart';
import '/app_common_data/app_colors.dart';
import '/app_common_data/common_data/global_variable.dart';
import '/shared_customization/extensions/string_ext.dart';
import 'app_image.dart';
import 'screens/app_image_full_screen.dart';
import 'screens/app_video_view_screen.dart';

class AppListImage extends StatelessWidget {
  final List<Files> files;
  final int amountOfImageShow;
  final double borderRadius;
  final double spaceXY;
  final void Function(int index)? onTap;
  const AppListImage({
    super.key,
    required this.files,
    this.amountOfImageShow = 3,
    this.spaceXY = 4,
    this.borderRadius = BORDER_RADIUS_VALUE,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size =
            constraints.maxWidth / amountOfImageShow - amountOfImageShow;

        return Wrap(
          alignment: WrapAlignment.center,
          runSpacing: spaceXY,
          spacing: spaceXY,
          children: [
            for (int i = 0; i < files.length; i++)
              if (i + 1 < amountOfImageShow)
                GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!.call(i);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AppImageFullScreen(
                                  params: AppImageFullScreenParams(
                                      files: files, initIndex: i))));
                    }
                  },
                  child: _imageItem(files[i], context, size),
                ),
            if (files.length >= amountOfImageShow)
              GestureDetector(
                onTap: () {
                  if (onTap != null) {
                    onTap!.call(amountOfImageShow);
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppImageFullScreen(
                                params: AppImageFullScreenParams(
                                    files: files,
                                    initIndex: amountOfImageShow - 1))));
                  }
                },
                child: AppContainer(
                  width: size,
                  height: size,
                  child: Stack(
                    children: [
                      _imageItem(files[amountOfImageShow - 1], context, size),
                      if (files.length - amountOfImageShow > 0)
                        Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            color: AppColors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(borderRadius),
                          ),
                          child: Center(
                            child: AppText(
                              "+${files.length - (amountOfImageShow)}",
                              size: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )
          ],
        );
      },
    );
  }

  Widget _imageItem(Files item, BuildContext context, double size) {
    return (item.name ?? item.url ?? "").isVideo
        ? GestureDetector(
            onTap: () {
              if ((item.name ?? item.url ?? "").isVideo) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AppVideoViewScreen(file: item)),
                );
              }
            },
            // child: VideoThumbnailWidget(
            //   file: null,
            //   url: item.url,
            //   width: size,
            //   height: size,
            // )
             child: AppImage(
              width: size,
              height: size,
              assetUrl: 'assets/images/video_thumbnail.png',
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            )
        : AppImage(
            url: item.url,
            fit: BoxFit.cover,
            width: size,
            height: size,
            borderRadius: BorderRadius.circular(borderRadius),
          );
  }
}
