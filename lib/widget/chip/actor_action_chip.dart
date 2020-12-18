import 'package:flutter/material.dart';

class ActorActionChip extends StatefulWidget {
  ActorActionChip({Key key}) : super(key: key);

  @override
  _ActorActionChipState createState() => _ActorActionChipState();
}

class _ActorActionChipState extends State<ActorActionChip> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Action chip"),
      ),
      body: Wrap(
        children: List<Widget>.generate(
          3,
              (int index) {
            return ActionChip(
                avatar: CircleAvatar(
                  backgroundColor: Colors.grey.shade800,
                  child: Text('AB'),
                ),
                label: Text('Aaron Burr'),
                onPressed: () {
                  print("If you stand for nothing, Burr, what’ll you fall for?");
                }
            );
          },
        ).toList(),
      ),
    );
  }
}