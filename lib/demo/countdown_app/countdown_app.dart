import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/channel/sound_channel/sound_channel.dart';
import 'package:flutter_demo/channel/vibration_channel/vibration_channel.dart';
import 'package:flutter_demo/demo/countdown_app/countdown.dart';

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

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
            Countdown(
              minutes: 1,
              fontSize: 20,
              vibration: true,
              sound: true,
              soundAssetPath: 'assets/sound/InspiringEpicCinematic.mp3',
              buttonText: "Start countdown",
              onPressed:  () async {
                print('Start');
              },
            )
          ],
        ),
      ),
    );
  }
}
