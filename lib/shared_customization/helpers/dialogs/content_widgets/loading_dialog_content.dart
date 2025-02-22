// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/shared_customization/animations/three_bounce/fade_in_out.dart';
import 'package:bio_explore/shared_customization/animations/three_bounce/three_bounce.dart';
import 'package:flutter/material.dart';

// Project imports:

class FadeAnimation extends StatefulWidget {
  final Widget? child;
  final AnimationController controller;

  const FadeAnimation({super.key, this.child, required this.controller});

  @override
  FadeAnimationState createState() => FadeAnimationState();
}

class FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);
  late final Animation<double> animation;
  late final Animation<double> animationOpacity;

  @override
  void initState() {
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);

    animationOpacity = tweenOpacity.animate(animation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationOpacity,
      child: widget.child,
    );
  }
}

class LoadingDialogContent extends StatelessWidget {
  const LoadingDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FadeInOut(
            visible: true,
            child: Container(
                width: 80.0,
                height: 80.0,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.white),
                child: const Center(
                  child: FadeInOut(
                      visible: true,
                      child: Center(
                          child: ThreeBounce(
                              color: AppColors.primary600, size: 20.0))),
                ))));
  }
}
