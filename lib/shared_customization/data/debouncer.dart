// Dart imports:
import 'dart:async';
import 'dart:ui';

class Debouncer {
  final Duration? delay;
  late VoidCallback action;
  Timer? _timer;

  Debouncer({this.delay});

  void call(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay ?? const Duration(milliseconds: 0), action);
  }

  run(VoidCallback newAction) {
    action = newAction;
    _timer?.cancel();
    _timer = Timer(delay!, () {
      action();
    });
  }


  bool get isRunning => _timer?.isActive ?? false;

  void cancel() => _timer?.cancel();

}
