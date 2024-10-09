import 'package:flutter/services.dart';

class VibrationChannel {
  static const _soundChannelName = "com.example/vibration"; // 定义方法通道名称
  static MethodChannel _channel;

  // 初始化通道
  static void initChannels() {
    _channel = MethodChannel(_soundChannelName);
  }

  static Future<void> vibrate() async {
    try {
      await _channel.invokeMethod('vibrate');
    } on PlatformException catch (e) {
      print("Failed to trigger vibration: ${e.message}");
    }
  }

  static Future<void> rhythmVibrate(List<int> pattern, bool repeat) async {
    try {
      await _channel.invokeMethod('rhythmVibrate',   {
      'pattern': pattern, // 震动模式
      'repeat': repeat, // 是否重复
      });
    } on PlatformException catch (e) {
      print("Failed to vibrate: ${e.message}");
    }
  }

  static Future<void> stopVibration() async {
    try {
      await _channel.invokeMethod('stopVibration');
    } on PlatformException catch (e) {
      print("Failed to stop vibration: ${e.message}");
    }
  }
}
