// Flutter imports:
import 'package:flutter/material.dart';

class FadeInOut extends StatelessWidget {
  final Widget child;
  final bool visible;

  const FadeInOut({super.key, required this.visible, required this.child});
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 10),
        opacity: visible == true ? 1.0 : 0.0,
        child: child);
  }
}
