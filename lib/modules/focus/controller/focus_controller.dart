import 'dart:async';

import 'package:get/get.dart';

class FocusController extends GetxController {
  var duration = const Duration().obs;
  var isRunning = false.obs;
  Timer? timer;

  startTimer() {
    isRunning.value = true;

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        final seconds = duration.value.inSeconds + 1;
        duration.value = Duration(seconds: seconds);
      },
    );
  }

  stopTimer() {
    isRunning.value = false;
    timer?.cancel();
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');
}
