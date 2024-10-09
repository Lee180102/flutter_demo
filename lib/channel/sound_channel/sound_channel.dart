import 'package:flutter/services.dart';

class SoundChannel {
  static const _soundChannelName = "com.example/sound";  // 定义方法通道名称
  static MethodChannel _soundChannel;

  // 初始化通道
  static void initChannels() {
    _soundChannel = MethodChannel(_soundChannelName);
  }

  // 调用播放音频的方法
  static Future<void> playSound(String soundPath) async {
    try {
      await _soundChannel.invokeMethod('playSound', soundPath);
    } on PlatformException catch (e) {
      print("Failed to play sound: '${e.message}'.");
    }
  }

  // 调用停止声音
  static Future<void> stopSound() async {
    try {
      await _soundChannel.invokeMethod('stopSound');
    } on PlatformException catch (e) {
      print("Failed to stop sound: ${e.message}");
    }
  }
}
