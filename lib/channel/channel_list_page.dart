import 'package:flutter/material.dart';

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
         ],
      ),
    );
  }
}