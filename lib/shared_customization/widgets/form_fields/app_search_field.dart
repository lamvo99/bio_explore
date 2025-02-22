// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/shared_customization/animations/three_bounce/loading_animation.dart';
import 'package:bio_explore/shared_customization/extensions/string_ext.dart';
import 'package:bio_explore/shared_customization/widgets/app_container.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// Package imports:

// Project imports:
import '../../../app_common_data/app_colors.dart';
import '../../../app_common_data/common_data/global_variable.dart';

class AppSearchField<T> extends StatefulWidget {
  final FutureOr<List<T>?> Function(String) suggestionsCallback;
  final Widget Function(BuildContext, T) itemBuilder;
  final Function(T)? onSelected;
  final String placeHolder;

  const AppSearchField({
    super.key,
    required this.suggestionsCallback,
    required this.itemBuilder,
    required this.onSelected,
    required this.placeHolder,
  });

  @override
  State<AppSearchField<T>> createState() => _AppSearchFieldState<T>();
}

class _AppSearchFieldState<T> extends State<AppSearchField<T>> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T>(
      controller: _controller,
      builder: (context, controller, focusNode) {
        return AppTextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: false,
          prefixIcon: Assets.icons.icSearch.svg(width: 14, height: 14),
          placeholder: widget.placeHolder,
          onChanged: (value) {},
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        );
      },
      suggestionsCallback: widget.suggestionsCallback,
      itemBuilder: widget.itemBuilder,
      emptyBuilder: (context) => Visibility(
        visible: _controller.text.isNotEmptyOrNull,
        child: AppContainer(
          color: AppColors.white,
          height: 120,
          child: NO_DATA_WIDGET,
        ),
      ),
      loadingBuilder: (context) =>
          const AppContainer(color: AppColors.white, child: LoadingAnimation()),
      onSelected: widget.onSelected,
    );
  }
}
