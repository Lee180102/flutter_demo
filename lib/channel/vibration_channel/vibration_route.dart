import 'package:flutter/material.dart';
import 'package:flutter_demo/channel/vibration_channel/vibration_channel.dart';

class VibrationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VibrationRouteState();
  }
}

class _VibrationRouteState extends State<VibrationRoute> {
  @override
  void initState() {
    super.initState();
    VibrationChannel.initChannels();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vibration Example'),
          centerTitle: true,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              List<int> pattern = [
                0,
                1000,
                500,
                1000,
                500,
                1000,
                500,
                1000
              ]; // 延迟0ms，震动1秒，暂停0.5秒，再震动1秒
              VibrationChannel.rhythmVibrate(pattern); // 调用震动
            },
            child: Text('Vibrate'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    VibrationChannel.stopVibration();
  }
}
