// Flutter imports:
import 'package:bio_explore/shared_customization/data/basic_types.dart';
import 'package:flutter/material.dart';

// Project imports:

class AppForm extends StatefulWidget {
  const AppForm({super.key, required this.child});
  final FormChildWidgetBuilder child;

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.child(_formKey),
    );
  }
}
