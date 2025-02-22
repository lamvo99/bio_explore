// Flutter imports:
import 'package:bio_explore/app_common_data/app_text_sytle.dart';
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/generated/strings.g.dart';
import 'package:bio_explore/shared_customization/animations/three_bounce/loading_animation.dart';
import 'package:bio_explore/shared_customization/extensions/list_ext.dart';
import 'package:bio_explore/shared_customization/widgets/app_refresh_indicator.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

// Package imports:

// Project imports:

class AppListBuilder<T> extends StatefulWidget {
  final Future<void> Function() onReload;
  final Widget Function(T item) onItemRender;
  final List<T>? sourceData;
  final EdgeInsets padding;
  final double mainAxisSpacing;

  const AppListBuilder({
    super.key,
    required this.sourceData,
    required this.onItemRender,
    required this.onReload,
    this.padding = EdgeInsets.zero,
    this.mainAxisSpacing = 0,
  });

  @override
  State<AppListBuilder<T>> createState() => _AppListBuilderState<T>();
}

class _AppListBuilderState<T> extends State<AppListBuilder<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AppRefreshIndicator(
          onRefresh: widget.onReload,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  maxHeight: (widget.sourceData.isEmptyOrNull)
                      ? constraints.maxHeight
                      : double.infinity),
              width: constraints.maxWidth,
              padding: widget.padding.copyWith(
                  bottom: widget.padding.bottom +
                      MediaQuery.of(context).padding.bottom),
              child: Column(
                mainAxisAlignment: (widget.sourceData.isEmptyOrNull)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.start,
                children: [
                  ///
                  /// Loading
                  ///
                  if (widget.sourceData == null)
                    const Center(child: LoadingAnimation())

                  ///
                  /// Sources empty
                  ///
                  else if (widget.sourceData != null &&
                      widget.sourceData!.isEmpty) ...[
                    Container(
                      constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                          maxHeight: (widget.sourceData.isEmptyOrNull)
                              ? constraints.maxHeight
                              : double.infinity),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.icNoData.svg(width: 215, height: 215),
                            const SizedBox(height: 8),
                            AppText(
                              i18n.CommonData.ListDataIsEmpty,
                              style: AppTextStyle.textGray90016W500,
                              textAlign: TextAlign.center,
                            ),
                            // const SizedBox(height: 8),
                            // TextButton(
                            //     onPressed: widget.onReload,
                            //     child: AppText(
                            //       "Tải lại trang",
                            //       style: AppTextStyle.textGray80016W500
                            //           .copyWith(color: AppColors.primary600),
                            //     ))
                          ],
                        ),
                      ),
                    )
                  ]

                  ///
                  /// Render list
                  ///
                  else
                    ...List.generate(
                            widget.sourceData!.length, (index) => index)
                        .fold<List<Widget>>(
                            <Widget>[],
                            (previousValue, index) => [
                                  ...previousValue,
                                  widget
                                      .onItemRender(widget.sourceData![index]),
                                  if (widget.mainAxisSpacing > 0)
                                    SizedBox(
                                      height: widget.mainAxisSpacing,
                                    )
                                ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
