// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:loading_animation_widget/loading_animation_widget.dart';

// Project imports:
import '/app_common_data/app_colors.dart';

class WaveDotLoadingAnimation extends StatelessWidget {
  final Color color;
  const WaveDotLoadingAnimation({
    super.key,
    this.color = AppColors.primary600,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.waveDots(
      color: color,
      size: 40,
    );
  }
}
