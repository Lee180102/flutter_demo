import 'dart:async';
import 'package:flutter/material.dart';

class CountdownApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountdownPage(),
    );
  }
}

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  Timer _timer;
  int _start = 1 * 60; // 30分钟 = 30 * 60秒
  Timer _vibrationTimer; // 定时震动的 Timer

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _timer?.cancel();
          _vibrateAndShowCompletionDialog(); // 倒计时结束后震动并弹窗提醒
        }
      });
    });
  }

  // 重置倒计时
  void _resetTimer() {
    setState(() {
      _start = 1 * 60; // 重置倒计时为30分钟
    });
  }

  // 震动并显示结束提示框，直到用户点击停止震动
  void _vibrateAndShowCompletionDialog() async {

    _showCompletionDialog(); // 弹出提醒框
  }

  // 手动震动循环
  void _startVibrationLoop() {
    _vibrationTimer = Timer.periodic(Duration(seconds: 2), (Timer timer) async {
      // 每 2 秒震动 500 毫秒

    });
  }

  // 停止震动并弹出倒计时结束提示框
  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('倒计时结束'),
          content: Text('30分钟倒计时已结束！'),
          actions: <Widget>[
            TextButton(
              child: Text('确定'),
              onPressed: () async {
                // 停止震动
                if (_vibrationTimer != null) {
                  _vibrationTimer?.cancel(); // 停止手动循环震动
                }

                Navigator.of(context).pop();
                _resetTimer(); // 点击确定后重置时间
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _vibrationTimer?.cancel(); // 停止震动循环
    super.dispose();
  }

  // 格式化倒计时为 mm:ss 格式
  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('倒计时30分钟'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '倒计时: ${formatTime(_start)}',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                startTimer();
              },
              child: Text('开始倒计时'),
            ),
          ],
        ),
      ),
    );
  }
}
