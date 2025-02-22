// Flutter imports:
import 'package:flutter/material.dart';

extension TimeOfDayExt on TimeOfDay? {
  int get toMilisecondSinceEpoch {
    DateTime currentDate = DateTime.now();
    DateTime dateTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      this!.hour,
      this!.minute,
    );
    return dateTime.millisecondsSinceEpoch;
  }
}
