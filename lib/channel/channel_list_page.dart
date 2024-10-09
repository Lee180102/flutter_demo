import 'package:flutter/material.dart';
import 'package:flutter_demo/channel/sound_channel/sound_route.dart';
import 'package:flutter_demo/channel/vibration_channel/vibration_route.dart';

import 'battery_channel/battery_route.dart';

class ChannelListPage extends StatefulWidget {
  ChannelListPage({Key key}) : super(key: key);

  @override
  _ChannelListPageState createState() => _ChannelListPageState();
}

class _ChannelListPageState extends State<ChannelListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原生调用"),
      ),
      body: ListView(
        children: [
          RaisedButton(child: Text("调用原生电量百分比"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BatteryRoute()))),
          RaisedButton(child: Text("调用原生播放声音"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SoundRoute()))),
          RaisedButton(child: Text("调用原生震动"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VibrationRoute()))),
         ],
      ),
    );
  }
}