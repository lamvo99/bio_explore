// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import '../../app_common_data/app_colors.dart';
import 'app_container.dart';

class AppRadio extends StatelessWidget {
  final bool value;
  final Function() onTap;
  final bool isCircle;

  const AppRadio(
      {super.key,
      required this.value,
      required this.onTap,
      this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AppContainer(
        width: 20,
        height: 20,
        border:
            Border.all(color: value ? AppColors.primary500 : AppColors.gray300),
        color: (value && !isCircle) ? AppColors.primary500 : AppColors.white,
        borderRadius: BorderRadius.circular(isCircle ? 9999 : 4),
        child: Visibility(
          visible: value,
          child: isCircle
              ? AppContainer(
                  width: 1.sw,
                  height: 1.sh,
                  margin: const EdgeInsets.all(4),
                  borderRadius: BorderRadius.circular(9999),
                  color: AppColors.primary600,
                )
              : const Icon(
                  CupertinoIcons.checkmark_alt,
                  color: Colors.white,
                  size: 18,
                ),
        ),
      ),
    );
  }
}
