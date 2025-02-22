// Flutter imports:
import 'dart:async';

import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/model/files/files.dart';
import 'package:bio_explore/shared_customization/animations/circular_loading_animation.dart';
import 'package:bio_explore/shared_customization/extensions/build_context_ext.dart';
import 'package:bio_explore/shared_customization/extensions/number_ext.dart';
import 'package:bio_explore/shared_customization/extensions/string_ext.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/buttons/app_button.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import '../../../../gen/assets.gen.dart';
import '../../app_layout.dart';
import '../app_dismiss_keyboard.dart';
import '../app_image.dart';
import 'app_video_view_screen.dart';

class AppImageFullScreenParams {
  final List<Files> files;
  final int initIndex;

  AppImageFullScreenParams({required this.files, required this.initIndex});

  AppImageFullScreenParams.withUrl({
    required List<String> urls,
    required this.initIndex,
  }) : files = urls.map((e) => Files(url: e)).toList();
}

class AppImageFullScreen extends StatefulWidget {
  final AppImageFullScreenParams params;

  const AppImageFullScreen({super.key, required this.params});

  @override
  State<AppImageFullScreen> createState() => _AppImageFullScreenState();
}

class _AppImageFullScreenState extends State<AppImageFullScreen> {
  late int currentIndex;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.params.initIndex);
    currentIndex = widget.params.initIndex;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onChangePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      child: AppLayout(
        title: '${currentIndex + 1}/${widget.params.files.length.toString()}',
        onWillPop: () => Future.value(true),
        appBarColor: AppColors.white,
        backgroundColor: AppColors.white,
        showAppBar: false,
        useSafeArea: true,
        body: Stack(
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const ClampingScrollPhysics(),
              enableRotation: false,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions.customChild(
                    heroAttributes: PhotoViewHeroAttributes(
                        tag: widget.params.files[index].url ??
                            const Uuid().v4()),
                    basePosition: Alignment.center,
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.contained * 2,
                    initialScale: PhotoViewComputedScale.contained,
                    child: _imageItem(widget.params.files[index]));
              },
              itemCount: widget.params.files.length,
              loadingBuilder: (context, event) =>
              const CircularLoadingAnimation(),
              backgroundDecoration: const BoxDecoration(color: AppColors.black),
              pageController: _pageController,
              onPageChanged: _onChangePage,
              scrollDirection: Axis.horizontal,
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppContainer(
                  height: AppBar().preferredSize.height,
                  color: AppColors.gray900.withOpacity(.5),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Icon(
                          CupertinoIcons.clear_thick,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 36),
                          child: AppText(
                            '${currentIndex + 1} / ${widget.params.files.length.toString()}',
                            style: AppTextStyle.textGray80012W500.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalAction(
                              context, widget.params.files[currentIndex]);
                        },
                        child: const Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: AppContainer(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: AppColors.gray900.withOpacity(.5),
                child: Column(
                  children: [
                    ///
                    /// AUDIO
                    ///
                    // if (widget.params.files[currentIndex].name!.isAudio) ...[
                    //   AudioPlayerWidget(
                    //       audioFile: widget.params.files[currentIndex]),
                    //   const SizedBox(height: 8),
                    // ],

                    ///
                    ///
                    ///
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // widget.params.files[currentIndex].name.iconFileMini(),
                        // const SizedBox(width: 6),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppText(
                                widget.params.files[currentIndex].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.textGray80012W500
                                    .copyWith(color: AppColors.white),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  // AppText(
                                  //   widget.params.files[currentIndex].createdAt
                                  //       .toDateFromMilliseconds,
                                  //   style: AppTextStyle.textPrimary12W500
                                  //       .copyWith(color: AppColors.WHITE),
                                  // ),
                                  AppText(
                                    widget.params.files[currentIndex].size
                                        .toByteFormat,
                                    style: AppTextStyle.textGray90014W400
                                        .copyWith(color: AppColors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _imageItem(Files item) {
    if ((item.name ?? item.url ?? "").isImage) {
      return AppImage(
        url: item.url,
        fit: BoxFit.fitWidth,
        backgroundColor: AppColors.gray900,
        borderRadius: BorderRadius.circular(0),
        width: 1.sw,
      );
    }

    if ((item.name ?? item.url ?? "").isVideo) {
      return AppContainer(
        width: 1.sw,
        height: 1.sh,
        color: AppColors.gray300,
        padding: EdgeInsets.only(
          bottom: 80,
          top: AppBar().preferredSize.height,
        ),
        child: AppVideoViewScreen(file: item),
      );
    }

    // if ((item.name ?? item.url).isAudio) {
    //   return AppContainer(
    //     width: MAX_WIDTH_SCREEN,
    //     height: MAX_HEIGHT_SCREEN,
    //     color: AppColors.NEUTRAL300,
    //     child: Center(
    //       child: Assets.icons.icAudio.svg(
    //           width: 100,
    //           colorFilter: const ColorFilter.mode(
    //               AppColors.NEUTRAL400, BlendMode.srcIn)),
    //     ),
    //   );
    // }

    return AppContainer(
      width: 1.sw,
      height: 1.sh,
      color: AppColors.gray300,
      child: Center(
        child: Assets.icons.icFile.svg(
            width: 100,
            colorFilter:
            const ColorFilter.mode(AppColors.gray400, BlendMode.srcIn)),
      ),
    );
  }

  ///
  /// SHOW ACTION FOR FILE
  ///
  void showModalAction(BuildContext context, Files file) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      backgroundColor: AppColors.transparent,
      builder: (BuildContext context) {
        return InkWell(
          onTap: () {
            context.pop();
          },
          child: AppContainer(
            height: 1.sh,
            width: 1.sw,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(10.0)),
            color: AppColors.gray200.withOpacity(.1),
            child: StatefulBuilder(builder: (context, StateSetter setStater) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppContainer(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () async {
                            context.pop();
                            // var cancel = showLoading();
                            // bool isSuccess = await FileHelpers()
                            //     .saveFileToLocal(file.url!, file.name!);
                            // if (isSuccess) {
                            //   cancel();
                            //   showSuccessBanner(
                            //       content: i18n.CommonNotiAction
                            //           .DownloadFileSuccessfully(
                            //           filename: file.name!));
                            // } else {
                            //   cancel();
                            //   showErrorBanner(
                            //       content: i18n.CommonNotiAction.Failed);
                            // }
                          },
                          child: AppContainer(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            width: 1.sw,
                            child: AppText(
                              i18n.CommonAction.Download,
                              style: AppTextStyle.textGray90014W500.copyWith(
                                color: AppColors.gray100,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // AppContainer(
                        //   width: MAX_HEIGHT_SCREEN,
                        //   height: 1,
                        //   color: AppColors.STROKE,
                        // ),
                        // InkWell(
                        //   onTap: () async {
                        //     var cancel = showLoading();
                        //     var appDocDir = await getTemporaryDirectory();
                        //     String tempPath = "${appDocDir.path}/${file.name}";
                        //     await Dio().download(file.url!, tempPath);
                        //     cancel();
                        //     await Share.shareXFiles([XFile(tempPath)]);
                        //   },
                        //   child: AppContainer(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 16, vertical: 12),
                        //     child: AppText(
                        //       i18n.CommonAction.Share,
                        //       style: AppTextStyle.textPrimary14W500.copyWith(
                        //         color: AppColors.BLUE100,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    onPressed: () {
                      context.pop();
                    },
                    width: 1.sw,
                    label: i18n.CommonAction.Cancel,
                    color: AppColors.white,
                    labelColor: AppColors.error100,
                    radius: BorderRadius.circular(16),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  const SizedBox(height: 16),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
