// // Flutter imports:
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:easy_localization/easy_localization.dart';
//
// // Project imports:
// import 'package:s_booking/app_common_data/app_text_sytle.dart';
// import 'package:s_booking/app_common_data/export.dart';
// import 'package:s_booking/generated/export.dart';
// import 'package:s_booking/shared_customization/export.dart';
// import 'package:s_booking/shared_customization/widgets/custom_widgets/app_shimmer_list.dart';
// import '../../animations/wave_dot_loading_animation.dart';
// import '/services/models/api_page_response/api_page_response.dart';
//
// class AppList<T> extends StatefulWidget {
//   final ScrollController? scrollController;
//   final Future<void> Function() onReload;
//   final Future Function(int page)? onLoadMore;
//   final Widget Function(T item) onItemRender;
//   final ApiPageResponse<T>? sourceData;
//   final String? errorMessage;
//   final EdgeInsets padding;
//   final Widget? emptyListIcon;
//   final Widget? separatedWidget;
//   final Widget? prefixListWidget;
//   final double mainAxisSpacing;
//   final bool Function(T value)? condition;
//
//   const AppList({
//     super.key,
//     this.scrollController,
//     required this.sourceData,
//     required this.onItemRender,
//     required this.onReload,
//     this.onLoadMore,
//     this.errorMessage,
//     this.emptyListIcon,
//     this.separatedWidget,
//     this.prefixListWidget,
//     this.padding = EdgeInsets.zero,
//     this.mainAxisSpacing = 0,
//     this.condition,
//   });
//
//   @override
//   State<AppList<T>> createState() => _AppListState<T>();
// }
//
// class _AppListState<T> extends State<AppList<T>> {
//   late final ScrollController _scrollController =
//       widget.scrollController ?? ScrollController();
//
//   List<T>? get sources => widget.sourceData?.data
//       ?.where(widget.condition != null ? widget.condition! : (element) => true)
//       .toList();
//   bool isLoadingMore = false;
//   final Debouncer _debouncer =
//       Debouncer(delay: const Duration(milliseconds: 100));
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(onScrollHandle);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.removeListener(onScrollHandle);
//     super.dispose();
//   }
//
//   void onScrollHandle() {
//     if (widget.onLoadMore != null &&
//         _scrollController.loadMorePointPassed &&
//         (widget.sourceData?.meta?.canNextPage ?? false) &&
//         !isLoadingMore) {
//       setState(() {
//         isLoadingMore = true;
//       });
//       _debouncer.call(() {
//         widget.onLoadMore
//             ?.call(widget.sourceData!.meta!.nextPage)
//             .then((value) {
//           setState(() {
//             isLoadingMore = false;
//           });
//         });
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           if (sources != null &&
//               sources!.isNotEmpty &&
//               constraints.maxHeight >
//                   _scrollController.position.maxScrollExtent &&
//               widget.onLoadMore != null &&
//               (widget.sourceData?.meta?.canNextPage ?? false) &&
//               !isLoadingMore) {
//             setState(() {
//               isLoadingMore = true;
//             });
//             _debouncer.call(() {
//               widget.onLoadMore
//                   ?.call(widget.sourceData!.meta!.nextPage)
//                   .then((value) {
//                 setState(() {
//                   isLoadingMore = false;
//                 });
//               });
//             });
//           }
//         });
//
//         return AppRefreshIndicator(
//           onRefresh: widget.onReload,
//           child: SingleChildScrollView(
//             controller: _scrollController,
//             physics: const AlwaysScrollableScrollPhysics(),
//             child: Container(
//               constraints: BoxConstraints(
//                   minHeight: constraints.maxHeight,
//                   maxHeight: widget.errorMessage != null ||
//                           (sources == null || sources!.isEmpty)
//                       ? constraints.maxHeight
//                       : double.infinity),
//               width: constraints.maxWidth,
//               padding: widget.padding.copyWith(
//                   bottom: widget.padding.bottom +
//                       MediaQuery.of(context).padding.bottom),
//               child: Column(
//                 mainAxisAlignment: widget.errorMessage != null ||
//                         (sources == null || sources!.isEmpty)
//                     ? MainAxisAlignment.center
//                     : MainAxisAlignment.start,
//                 children: [
//                   ///
//                   /// Error message
//                   ///
//                   if (widget.errorMessage != null) ...[
//                     Center(
//                       child: AppText(
//                         widget.errorMessage ?? "",
//                         textAlign: TextAlign.center,
//                       ),
//                     )
//                   ]
//
//                   ///
//                   /// Loading
//                   ///
//                   else if (sources == null)
//                     const Expanded(child: Center(child: ShimmerLoadingScreen()))
//
//                   ///
//                   /// Sources empty
//                   ///
//                   else if (sources != null && sources!.isEmpty) ...[
//                     if (widget.emptyListIcon != null)
//                       widget.emptyListIcon!
//                     else
//                       Container(
//                         constraints: BoxConstraints(
//                             minHeight: constraints.maxHeight,
//                             maxHeight: widget.errorMessage != null ||
//                                     (sources == null || sources!.isEmpty)
//                                 ? constraints.maxHeight
//                                 : double.infinity),
//                         child: Center(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Assets.icons.icEmpty.svg(width: 215, height: 215),
//                               const SizedBox(height: 8),
//                               AppText(
//                                 tr(LocaleKeys.CommonData_ListDataIsEmpty),
//                                 style: AppTextStyle.textGray80016W500,
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                   ]
//
//                   ///
//                   /// Render list
//                   ///
//                   else
//                     ...List.generate(sources!.length, (index) => index)
//                         .fold<List<Widget>>(
//                             <Widget>[],
//                             (previousValue, index) => [
//                                   ...previousValue,
//                                   widget.onItemRender(sources![index]),
//                                   if (widget.separatedWidget != null &&
//                                       index < sources!.length - 1)
//                                     widget.separatedWidget!,
//                                   if (widget.mainAxisSpacing > 0)
//                                     SizedBox(
//                                       height: widget.mainAxisSpacing,
//                                     )
//                                 ]),
//
//                   ///
//                   /// Loading more
//                   ///
//                   if (isLoadingMore)
//                     const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           WaveDotLoadingAnimation(),
//                           // const SizedBox(width: 8),
//                           // AppText(tr(LocaleKeys.CommonData_LoadingMore))
//                         ]),
//
//                   ///
//                   /// Center if error or empty
//                   ///
//                   if (widget.errorMessage != null ||
//                       (sources != null && sources!.isEmpty))
//                     const Spacer()
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/shared_customization/animations/three_bounce/three_bounce.dart';
import 'package:bio_explore/shared_customization/data/debouncer.dart';
import 'package:bio_explore/shared_customization/extensions/list_ext.dart';
import 'package:bio_explore/shared_customization/extensions/meta_ext.dart';
import 'package:bio_explore/shared_customization/extensions/scroll_controller_ext.dart';
import 'package:bio_explore/shared_customization/widgets/app_refresh_indicator.dart';
import 'package:bio_explore/shared_customization/widgets/custom_widgets/app_shimmer_list.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:

// Project imports:
import '/services/models/api_page_response/api_page_response.dart';

class AppList<T> extends StatefulWidget {
  final ScrollController? scrollController;
  final Future<void> Function() onReload;
  final Future Function(int page)? onLoadMore;
  final Widget Function(T item) onItemRender;
  final ApiPageResponse<T>? sourceData;
  final String? errorMessage;
  final EdgeInsets padding;
  final Widget? emptyListIcon;
  final Widget? separatedWidget;
  final Widget? prefixListWidget;
  final double mainAxisSpacing;
  final bool showPrefixWhenEmpty;
  final double? heightSubtract;

  final Future<void> Function()? onRefresh;
  final bool isGridLayout;
  final bool Function(T value)? condition;

  const AppList({
    super.key,
    this.scrollController,
    required this.sourceData,
    required this.onItemRender,
    required this.onReload,
    this.onLoadMore,
    this.onRefresh,
    this.errorMessage,
    this.emptyListIcon,
    this.separatedWidget,
    this.prefixListWidget,
    this.padding = EdgeInsets.zero,
    this.mainAxisSpacing = 0,
    this.showPrefixWhenEmpty = false,
    this.isGridLayout = false,
    this.heightSubtract = 0,
    this.condition,
  });

  @override
  State<AppList<T>> createState() => _AppListState<T>();
}

class _AppListState<T> extends State<AppList<T>> {
  late final ScrollController _scrollController =
      widget.scrollController ?? ScrollController();

  List<T>? get sources => widget.sourceData?.data
      ?.where(widget.condition != null ? widget.condition! : (element) => true)
      .toList();
  GlobalKey prefixKey = GlobalKey();
  double prefixHeight = 0;
  bool isLoadingMore = false;
  final isLoadingMoreStreamController = StreamController<bool>.broadcast()
    ..add(false);
  final Debouncer _debouncer =
      Debouncer(delay: const Duration(milliseconds: 100));

  @override
  void initState() {
    if (widget.prefixListWidget != null &&
        widget.showPrefixWhenEmpty &&
        prefixKey.currentContext != null) {
      setState(() {
        prefixHeight = prefixKey.currentContext!.size?.height ?? 0;
      });
    }
    super.initState();
    // _scrollController.addListener(onScrollHandle);
  }

  @override
  void dispose() {
    // _scrollController.removeListener(onScrollHandle);
    super.dispose();
  }

  bool onScrollHandle(scrollNotification) {
    if (widget.onLoadMore != null &&
        _scrollController.loadMorePointPassed &&
        (widget.sourceData?.meta?.canNextPage ?? false) &&
        !isLoadingMore) {
      setState(() {
        isLoadingMore = true;
      });

      _debouncer.run(() {
        isLoadingMoreStreamController.add(true);
        widget.onLoadMore
            ?.call(widget.sourceData!.meta!.nextPage)
            .then((value) {
          Future.delayed(const Duration(milliseconds: 300), () {
            isLoadingMoreStreamController.add(false);
            isLoadingMore = false;
          });
        });
      });

      // _debouncer.call(() {
      //   widget.onLoadMore
      //       ?.call(widget.sourceData!.meta!.nextPage)
      //       .then((value) {
      //     setState(() {
      //       isLoadingMore = false;
      //     });
      //   });
      // });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Kiểm tra nếu dữ liệu chưa đủ chiếm hết màn hình, gọi API load thêm dữ liệu.
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   if (sources != null &&
        //       sources!.isNotEmpty &&
        //       constraints.maxHeight >
        //           _scrollController.position.maxScrollExtent &&
        //       widget.onLoadMore != null &&
        //       (widget.sourceData?.meta?.canNextPage ?? false) &&
        //       !isLoadingMore) {
        //     setState(() {
        //       isLoadingMore = true;
        //     });
        //     _debouncer.call(() {
        //       widget.onLoadMore
        //           ?.call(widget.sourceData!.meta!.nextPage)
        //           .then((value) {
        //         setState(() {
        //           isLoadingMore = false;
        //         });
        //       });
        //     });
        //   }
        // });

        return AppRefreshIndicator(
          onRefresh: widget.onReload,
          child: NotificationListener<ScrollNotification>(
            onNotification: onScrollHandle,
            child: RawScrollbar(
              // thumbColor: widget.sourceData != null &&
              //             widget.sourceData!.message ==
              //                 tr(LocaleKeys.Branch_NoInternet) ||
              //         (widget.sourceData?.data ?? []).isEmptyOrNull
              //     ? AppColors.transparent
              //     : AppColors.primary500,
              thumbColor:
                      (widget.sourceData?.data ?? []).isEmptyOrNull
                  ? AppColors.transparent
                  : AppColors.primary500,
              trackColor: AppColors.primary500,
              radius: const Radius.circular(10),
              interactive: true,
              trackVisibility: true,
              thickness: 4,
              controller: _scrollController,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      maxHeight: widget.errorMessage != null ||
                              (sources == null || sources!.isEmpty)
                          ? constraints.maxHeight
                          : double.infinity),
                  width: constraints.maxWidth,
                  padding: widget.padding.copyWith(
                      // bottom: widget.padding.bottom +
                      //     MediaQuery.of(context).padding.bottom
                      ),
                  child: Column(
                    mainAxisAlignment: widget.errorMessage != null ||
                            (sources == null || sources!.isEmpty)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      ///
                      /// Error message
                      ///
                      if (widget.errorMessage != null) ...[
                        Center(
                          child: AppText(
                            widget.errorMessage ?? "",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ]

                      ///
                      /// Loading
                      ///
                      else if (sources == null)
                        Expanded(child: ShimmerLoadingScreen())

                      ///
                      /// Sources empty
                      ///
                      else if (sources != null && sources!.isEmpty) ...[
                        if (widget.emptyListIcon != null)
                          widget.emptyListIcon!
                        else
                          Container(
                            // constraints: BoxConstraints(
                            //   minHeight: constraints.maxHeight,
                            // ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Assets.icons.icNoData
                                      .svg(width: 215, height: 215),
                                  const SizedBox(height: 8),
                                  AppText(
                                    i18n.CommonData.ListDataIsEmpty,
                                    style: AppTextStyle.textGray90016W500,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ]

                      ///
                      /// Render list
                      ///
                      else if (widget.isGridLayout)
                        AppRefreshIndicator(
                          onRefresh: () async {
                            if (widget.onRefresh != null) {
                              widget.onRefresh!();
                            }
                          },
                          child: SizedBox(
                            height:
                                constraints.maxHeight - widget.heightSubtract!,
                            width: 1.sw,
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12,
                                      mainAxisSpacing: 4,
                                      childAspectRatio: 0.75),
                              shrinkWrap: true,
                              itemCount: sources!.length,
                              itemBuilder: (context, index) {
                                return widget.onItemRender(sources![index]);
                              },
                            ),
                          ),
                        )
                      else
                        ...List.generate(sources!.length, (index) => index)
                            .fold<List<Widget>>(
                                <Widget>[],
                                (previousValue, index) => [
                                      ...previousValue,
                                      widget.onItemRender(sources![index]),
                                      if (widget.separatedWidget != null &&
                                          index < sources!.length - 1)
                                        widget.separatedWidget!,
                                      if (widget.mainAxisSpacing > 0)
                                        SizedBox(
                                          height: widget.mainAxisSpacing,
                                        )
                                    ]),

                      ///
                      /// Loading more
                      ///
                      // if (isLoadingMore)
                      //   const Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         LoadingAnimation()
                      //         // const CircularLoadingAnimation(),
                      //         // const SizedBox(width: 8),
                      //         // AppText(tr(LocaleKeys.CommonData_LoadingMore))
                      //       ]),

                      StreamBuilder<bool>(
                          stream: isLoadingMoreStreamController.stream,
                          builder: (context, snapshot) {
                            if (snapshot.data == true &&
                                (widget.sourceData?.data ?? [])
                                    .isNotEmptyOrNull) {
                              return const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ThreeBounce(
                                        color: AppColors.primary600, size: 20.0)
                                  ],
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          }),

                      ///
                      /// Center if error or empty
                      ///
                      if (widget.errorMessage != null ||
                          (sources != null && sources!.isEmpty))
                        const Spacer()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
