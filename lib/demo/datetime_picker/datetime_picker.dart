import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_widget/datetime_text_field/date_time_text_field.dart';
import 'package:intl/intl.dart';

class DatetimePicker extends StatefulWidget {
  DatetimePicker({Key key}) : super(key: key);

  @override
  _DatetimePickerState createState() => _DatetimePickerState();
}

class _DatetimePickerState extends State<DatetimePicker> {
  DateTime _selectTime = DateTime.now();
  DateTime _selectTime1 = DateTime.now();
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("时间选择"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              _showDatePicker();
            },
            child: Row(
              children: <Widget>[Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectTime)), Icon(Icons.arrow_drop_down)],
            ),
          ),
          InkWell(
            onTap: () {
              _showCupertinoDatePicker();
            },
            child: Row(
              children: <Widget>[Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectTime1)), Icon(Icons.arrow_drop_down)],
            ),
          ),
          Container(
            child: InkWell(
              child: Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 20, right: 10, top: 2, bottom: 2),
                      child: Text("开始时间 $_startTime"),
                    ),
                  ),
                  Text("-"),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10, right: 20, top: 2, bottom: 2),
                      child: Text("结束时间 $_endTime"),
                    ),
                  ),
                ],
              ),
              onTap: () {
                _showDateRangePicker();
              },
            ),
          ),

          DateTimeTextField(
            onDateTimeChanged: (v) {
              print("now : " + v.toString());
            },
          )
          // SizedBox(
          //   height: 200,
          //   child: CupertinoDatePicker(
          //     use24hFormat: true,
          //     mode: CupertinoDatePickerMode.date,
          //     maximumYear: 2099,
          //     minimumYear: 1990,
          //     onDateTimeChanged: (DateTime value) {
          //       _selectTime = value;
          //       setState(() {});
          //       print(value);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  _showDateRangePicker() async {
    var result = await showDateRangePicker(
      context: context,
      // initialDateRange: DateTimeRange(start: DateTime(2020, 5, 9), end: DateTime(2020, 5, 22)),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime(2099, 12, 31),
      currentDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendar,
      helpText: '帮助文本：这是一个范围日期选择器',
      cancelText: '取消',
      confirmText: '确定',
      errorFormatText: '输入日期格式错误',
      errorInvalidText: '输入日期超出可选范围',
      saveText: '保存',
      fieldStartLabelText: '开始日期',
      fieldStartHintText: '请输入开始日期',
      fieldEndHintText: '请输入结束日期',
      fieldEndLabelText: '结束日期',
      builder: (context, widget) {
        return Theme(
          data: ThemeData.dark(),
          child: widget,
        );
      },
    );
    setState(() {
      if (result != null) {
        var _dateRange = '${result.start.year}年${result.start.month}月${result.start.day}日 - ${result.end.year}年${result.end.month}月${result.end.day}日';
        print(_dateRange);
        _startTime = result.start;
        _endTime = result.end;
      }
    });
  }

  _showCupertinoDatePicker() {
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.dateAndTime,
            maximumYear: 2099,
            minimumYear: 1990,
            onDateTimeChanged: (DateTime value) {
              _selectTime1 = value;
              setState(() {});
              print(value);
            },
          ),
        );
      },
    );
  }

  Future<DateTime> _showDatePicker() {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        //未来30天可选
        Duration(days: 30),
      ),
    );
  }
}
