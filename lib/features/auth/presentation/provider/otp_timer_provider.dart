import 'dart:async';
import 'package:flutter/material.dart';

class OtpTimerProvider extends ChangeNotifier {
  int secondsForResendOtp;
  Timer? _timer;
  int _secondsLeft = 0;

  int get secondsLeft => _secondsLeft;
  OtpTimerProvider(this.secondsForResendOtp);

  void startTimer() {
    _timer?.cancel();
    _secondsLeft = secondsForResendOtp;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsLeft == 1) {
        _timer?.cancel();
        _secondsLeft = 0;
      } else {
        _secondsLeft--;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
