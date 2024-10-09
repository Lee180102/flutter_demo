import 'package:flutter/material.dart';
import 'package:flutter_demo/channel/sound_channel/sound_channel.dart';

class SoundRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SoundRouteState();
  }
}

class SoundRouteState extends State<SoundRoute> {
  @override
  void initState() {
    super.initState();
    SoundChannel.initChannels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SoundRoute"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Play Sound'),
          onPressed: () {
            SoundChannel.playSound("assets/sound/alert.mp3"); // 传递音频路径
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SoundChannel.stopSound();
  }
}
