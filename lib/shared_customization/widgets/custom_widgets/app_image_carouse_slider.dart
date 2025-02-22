// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/routes/app_routes.dart';
import 'package:bio_explore/shared_customization/enums/image_type.dart';
import 'package:bio_explore/shared_customization/extensions/build_context_ext.dart';
import 'package:bio_explore/shared_customization/extensions/list_ext.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/custom_widgets/app_image.dart';
import 'package:bio_explore/shared_customization/widgets/custom_widgets/screens/app_image_full_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:

// Project imports:

class AppImageCarouseSlider extends StatefulWidget {
  final List<String> images;

  const AppImageCarouseSlider({
    super.key,
    required this.images,
  });

  @override
  State<AppImageCarouseSlider> createState() => _AppImageCarouseSliderState();
}

class _AppImageCarouseSliderState extends State<AppImageCarouseSlider> {
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      width: 1.sw,
      height: 180,
      child: widget.images.isNotEmptyOrNull
          ? Stack(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 180,
                  child: CarouselSlider.builder(
                    itemCount: widget.images.length,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentPos = index;
                          });
                        },
                        viewportFraction: 1),
                    itemBuilder: (context, index, i) {
                      return InkWell(
                        onTap: () {
                          context.pushNamed(Routes.imageFullScreen,
                              arguments: AppImageFullScreenParams.withUrl(
                                  initIndex: index, urls: widget.images));
                        },
                        child: AppImage(
                          width: 1.sw,
                          height: 180,
                          fit: BoxFit.cover,
                          url: widget.images[index],
                          imageType: ImageType.image,
                          borderRadius: BorderRadius.circular(0),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.images.map((url) {
                      int index = widget.images.indexOf(url);
                      return AppContainer(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 3),
                        borderRadius: BorderRadius.circular(9999),
                        color: currentPos == index
                            ? AppColors.primary600
                            : AppColors.gray200,
                      );
                    }).toList(),
                  ),
                ),
              ],
            )
          : AppImage(
              width: 1.sw,
              height: 180,
              url: "",
            ),
    );
  }
}
