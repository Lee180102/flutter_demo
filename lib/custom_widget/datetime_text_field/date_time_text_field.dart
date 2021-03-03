import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeTextField extends StatefulWidget {
  DateTimeTextField({Key key, this.onDateTimeChanged}) : super(key: key);
  final ValueChanged<DateTime> onDateTimeChanged;

  @override
  _DateTimeTextFieldState createState() {
    return _DateTimeTextFieldState();
  }
}

class _DateTimeTextFieldState extends State<DateTimeTextField> {
  DateTime _selectTime;

  @override
  void initState() {
    super.initState();
    _selectTime = DateTime.now();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              _showCupertinoDatePicker();
            },
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(left: 20, right: 10, top: 2, bottom: 2),
              child: Text(DateFormat('yyyy-MM-dd').format(_selectTime)),
            ),
          ),
        ),
        Text(" "),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                _showCupertinoTimePicker();
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10, right: 20, top: 2, bottom: 2),
                child: Text(DateFormat('HH:mm:ss').format(_selectTime)),
              ),
            )),
      ],
    );
  }

  _showCupertinoDatePicker() {
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return Container(
          color: Colors.white,
          height: 200,
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.date,
            maximumYear: 2099,
            minimumYear: 1990,
            onDateTimeChanged: (DateTime value) {
              _selectTime = DateTime(value.year, value.month, value.day, _selectTime.hour, _selectTime.minute, _selectTime.second);
              setState(() {});
              widget.onDateTimeChanged(_selectTime);
            },
          ),
        );
      },
    );
  }

  _showCupertinoTimePicker() {
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return Container(
          color: Colors.white,
          height: 200,
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.time,
            maximumYear: 2099,
            minimumYear: 1990,
            onDateTimeChanged: (DateTime value) {
              _selectTime = DateTime(_selectTime.year, _selectTime.month, _selectTime.day, value.hour, value.minute, value.second);
              setState(() {});
              widget.onDateTimeChanged(_selectTime);
            },
          ),
        );
      },
    );
  }
}
