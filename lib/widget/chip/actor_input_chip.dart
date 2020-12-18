import 'package:flutter/material.dart';

class ActorInputChip extends StatefulWidget {
  ActorInputChip({Key key}) : super(key: key);

  @override
  _ActorInputChipState createState() => _ActorInputChipState();
}

class _ActorInputChipState extends State<ActorInputChip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input Chip"),),
      body: InputChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Text('AB'),
          ),
          label: Text('Aaron Burr'),
          onPressed: () {
            print('I am the one thing in life.');
          }
      ),
    );

  }
}