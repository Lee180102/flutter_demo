import 'package:flutter/material.dart';

class SingleChoiceChip extends StatelessWidget {
  final List<Option> dataList;
  final ValueChanged<bool> onSelected;
  const SingleChoiceChip({Key key, @required this.dataList , this.onSelected});

  @override
  Widget build(BuildContext context) {
    int _value  ;
    return Container(
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
                    label: Text('Item $index'),
                    selected: _value == index,
                    onSelected: onSelected
                  ),
                );
              },
            ).toList(),
          ),
        ],
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