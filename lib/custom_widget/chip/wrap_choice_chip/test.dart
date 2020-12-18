import 'package:flutter/material.dart';

class SingleChoiceChipTest extends StatefulWidget {
  SingleChoiceChipTest({Key key}) : super(key: key);

  @override
  _SingleChoiceChipTestState createState() => _SingleChoiceChipTestState();
}

class _SingleChoiceChipTestState extends State<SingleChoiceChipTest> {
  int _value = 1;
  final List<Option> _cast = <Option>[
     Option('Aaron Burr', 'AB',false),
     Option('Alexander Hamilton', 'AH',false),
     Option('Eliza Hamilton', 'EH',false),
     Option('James Madison', 'JM',false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("单选",style: TextStyle(fontSize: 14),),
            ),
            Wrap(
              children: List<Widget>.generate(
                3,
                (int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: ChoiceChip(
                      label: Text(_cast[index].label),
                      selected: _value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : null;
                        });
                      },
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Option {
  String label;
  String value;
  bool deleted;

  Option(this.label, this.value, this.deleted);

  Option.fromJson(Map<String, dynamic> json)
      : label = json["label"],
        value = json["value"],
        deleted = json["deleted"];

  Map<String, dynamic> toJson() => <String, dynamic>{"label": label, "value": value, "deleted": deleted};

  static List<Option> allFromJson(List jsonList) {
    return jsonList.map((json) => Option.fromJson(json)).toList();
  }
}