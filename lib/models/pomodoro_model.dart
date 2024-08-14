import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroModel extends ChangeNotifier {
  static const int workTime = 25 * 60; // 25 minutes in seconds
  final ValueNotifier<double> progressNotifier = ValueNotifier(1.0);
  int _timeLeft = workTime;
  bool _isActive = false;
  DateTime? _startTime;

  int get timeLeft => _timeLeft;
  bool get isActive => _isActive;

  void startTimer() {
    if (!_isActive) {
      _isActive = true;
      _startTime = DateTime.now().subtract(Duration(seconds: workTime - _timeLeft));
      _updateTimer();
      notifyListeners();
    }
  }

  void _updateTimer() {
    if (_isActive) {
      final elapsedSeconds = DateTime.now().difference(_startTime!).inSeconds;
      _timeLeft = workTime - elapsedSeconds;
      if (_timeLeft <= 0) {
        stopTimer();
        _timeLeft = 0;
      } else {
        progressNotifier.value = _timeLeft / workTime;
        Future.delayed(Duration(milliseconds: 100), _updateTimer);
      }
      notifyListeners();
    }
  }

  void stopTimer() {
    _isActive = false;
    notifyListeners();
  }

  void resetTimer() {
    stopTimer();
    _timeLeft = workTime;
    progressNotifier.value = 1.0;
    notifyListeners();
  }
}