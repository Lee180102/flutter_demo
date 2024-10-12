import 'dart:async';
import 'package:flutter/material.dart';

class CountdownProvider with ChangeNotifier {
  int _start = 60;
  Timer _timer;
  bool _isCompleted = false; // 用来标识倒计时是否完成

  int get start => _start;
  bool get isCompleted => _isCompleted;

  void startTimer(int minutes) {
    _start = minutes * 60;
    _isCompleted = false;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _start--;
      notifyListeners(); // 每秒通知 UI 更新

      if (_start <= 0) {
        _timer.cancel();
        _isCompleted = true; // 标记倒计时完成
        notifyListeners(); // 通知 UI 倒计时结束
      }
    });
  }

  void resetTimer(int minutes) {
    _timer?.cancel();
    _start = minutes * 60;
    _isCompleted = false;
    notifyListeners();
  }

  void stopTimer() {
    _timer?.cancel();
    _isCompleted = true;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
