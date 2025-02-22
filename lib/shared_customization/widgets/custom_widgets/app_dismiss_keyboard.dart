import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDismissKeyboard extends StatelessWidget {
  final Widget child;
  const AppDismissKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
          SystemChannels.textInput.invokeMethod("TextInput.hide");
        }
      },
      child: child,
    );
  }
}