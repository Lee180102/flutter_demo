import 'package:flutter/material.dart';

class ActorChoiceChip extends StatefulWidget {
  ActorChoiceChip({Key key}) : super(key: key);

  @override
  _ActorChoiceChipState createState() => _ActorChoiceChipState();
}

class _ActorChoiceChipState extends State<ActorChoiceChip> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choice chip"),
      ),
      body: Wrap(
        children: List<Widget>.generate(
          3,
              (int index) {
            return ChoiceChip(
              label: Text('Item $index'),
              selected: _value == index,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                });
              },
            );
          },
        ).toList(),
      ),
    );
  }
}