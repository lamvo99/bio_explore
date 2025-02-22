// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '/app_common_data/app_colors.dart';

class CircularLoadingAnimation extends StatelessWidget {
  final Color color;
  const CircularLoadingAnimation({
    super.key,
    this.color = AppColors.primary600,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
      strokeWidth: 3,
    );
  }
}
