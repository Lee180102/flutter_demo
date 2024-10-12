import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/channel/sound_channel/sound_channel.dart';
import 'package:flutter_demo/channel/vibration_channel/vibration_channel.dart';
import 'package:provider/provider.dart';
import 'countdown_provider.dart';

class Countdown extends StatefulWidget {
  final double fontSize;
  final bool vibration;
  final bool sound;
  final String soundAssetPath;

  Countdown(
      {Key key,
      this.fontSize = 40,
      this.vibration,
      this.sound,
      this.soundAssetPath})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CountdownProvider>(
            builder: (context, countdownProvider, child) {
              if (countdownProvider.isCompleted) {
                // 倒计时完成后弹出对话框
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _vibrateAndShowCompletionDialog(context, countdownProvider);
                });
              }
              return Text(
                '倒计时: ${_formatTime(countdownProvider.start)}',
                style: TextStyle(fontSize: widget.fontSize),
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  // 显示倒计时结束的对话框
  void _showCompletionDialog(
      BuildContext context, CountdownProvider countdownProvider) {
    showDialog(
      context: context,
      barrierDismissible: false, // 设置为 false 防止点击外部关闭弹窗
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async {
            // 当用户点击返回键关闭对话框时，也停止震动和声音
            _stopSoundAndVibration(countdownProvider);
            return true;
          },
          child: AlertDialog(
            title: Text('倒计时结束'),
            content: Text('倒计时已结束！'),
            actions: <Widget>[
              TextButton(
                child: Text('确定'),
                onPressed: () async {
                  // 停止震动和声音
                  _stopSoundAndVibration(countdownProvider); // 重置倒计时
                  Navigator.of(context).pop(); // 关闭对话框
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // 停止声音和震动
  void _stopSoundAndVibration(CountdownProvider countdownProvider) async {
    if (widget.vibration) {
      VibrationChannel.stopVibration();
    }
    bool exists = await assetExists(widget.soundAssetPath);
    if (widget.sound && exists) {
      SoundChannel.stopSound();
    }
    countdownProvider.resetTimer(1);
  }

  // 震动并显示结束提示框，直到用户点击停止震动
  void _vibrateAndShowCompletionDialog(
      BuildContext context, CountdownProvider countdownProvider) async {
    bool exists = await assetExists(widget.soundAssetPath);
    if (widget.sound && exists) {
      SoundChannel.playSound(widget.soundAssetPath, true);
    }
    List<int> pattern = [500, 500, 500];
    if (widget.vibration) {
      VibrationChannel.rhythmVibrate(pattern, true);
    }
    _showCompletionDialog(context, countdownProvider); // 弹出提醒框
  }

  Future<bool> assetExists(String assetPath) async {
    try {
      // 尝试加载 asset 文件
      await rootBundle.load(assetPath);
      return true;
    } catch (e) {
      // 如果捕获到异常，说明文件不存在或加载失败
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.sound) {
      SoundChannel.initChannels();
    }
    if (widget.vibration) {
      VibrationChannel.initChannels();
    }
  }

  @override
  void dispose() {
    super.dispose();
    VibrationChannel.stopVibration();
    SoundChannel.stopSound();
  }
}
