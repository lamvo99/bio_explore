// Dart imports:
import 'dart:core';

// Flutter imports:
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/model/files/files.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

// Project imports:
import '../../../animations/circular_loading_animation.dart';
import '../../app_layout.dart';
import '../app_dismiss_keyboard.dart';
import '/app_common_data/app_colors.dart';
import '/shared_customization/extensions/string_ext.dart';
import '/shared_customization/helpers/banner_helper.dart';
import '/shared_customization/helpers/common_helper.dart';
import '/shared_customization/helpers/dialogs/dialog_helper.dart';

class AppVideoViewScreen extends StatefulWidget {
  final Files file;
  const AppVideoViewScreen({super.key, required this.file});

  @override
  State<StatefulWidget> createState() {
    return _AppVideoViewScreenState();
  }
}

class _AppVideoViewScreenState extends State<AppVideoViewScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget
            .file.url.isNotEmptyOrNull
        ? widget.file.url!
        : "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4"));

    await Future.wait([_videoPlayerController.initialize()]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      allowFullScreen: true,
      allowMuting: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ],
      materialProgressColors: ChewieProgressColors(
          backgroundColor: AppColors.primaryBackground,
          playedColor: AppColors.primaryColor,
          handleColor: AppColors.primaryBackground,
          bufferedColor: AppColors.white),
      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(0),
        child: subtitle is InlineSpan
            ? RichText(
                text: subtitle,
              )
            : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.black),
              ),
      ),
    );
  }

  Future<void> toggleVideo() async {
    await _videoPlayerController.pause();
    await initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return AppDismissKeyboard(
      child: Builder(builder: (context) {
        return AppLayout(
          bottomColor: AppColors.black,
          onWillPop: () => Future.value(true),
          appBarColor: AppColors.primaryBackground,
          backgroundColor: AppColors.primaryBackground,
          actions: [
            GestureDetector(
              onTap: () async {
                showConfirmDialog(
                  context,
                  title: i18n.CommonAction.Download,
                  content: i18n.CommonNotiAction.DownloadFile,
                  onAccept: () {
                    CommonHelper.downloadFile(
                            widget.file.url!, widget.file.name!)
                        .then((value) {
                      showSuccessBanner(
                          content: i18n
                                  .CommonNotiAction.DownloadFileSuccessfully(filename: widget.file.name ?? ""));
                    });
                  },
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: const Icon(
                  Icons.file_download_rounded,
                  size: 24,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
          body: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: AppColors.black,
                  child: Center(
                    child: _chewieController != null &&
                            _chewieController!
                                .videoPlayerController.value.isInitialized
                        ? Chewie(controller: _chewieController!)
                        : const CircularLoadingAnimation(),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
