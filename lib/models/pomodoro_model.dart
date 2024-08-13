import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroModel extends ChangeNotifier {
  static const int workTime = 25 * 60;
  int _timeLeft = workTime;
  bool _isActive = false;
  Timer? _timer;

  int get timeLeft => _timeLeft;
  bool get isActive => _isActive;

  void startTimer() {
    if (!_isActive) {
      _isActive = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_timeLeft > 0) {
          _timeLeft--;
          notifyListeners();
        } else {
          stopTimer();
        }
      });
    }
  }

  void stopTimer() {
    _isActive = false;
    _timer?.cancel();
    notifyListeners();
  }

  void resetTimer() {
    stopTimer();
    _timeLeft = workTime;
    notifyListeners();
  }
}