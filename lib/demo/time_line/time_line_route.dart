import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeLineRoute extends StatefulWidget {
  TimeLineRoute({Key key}) : super(key: key);

  @override
  _TimeLineRouteState createState() => _TimeLineRouteState();
}

class _TimeLineRouteState extends State<TimeLineRoute> {
  List<Widget> list = [
    Text("内容 1 "),
    Container(
      child: Container(
        height: 100,
        child: Text(
          "内容 asdf ",
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("时间轴"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: 100,
                    child: Text("2021-01-01"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10, left: 6, right: 3),
                    width: 23,
                    height: 23,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Icon(
                      Icons.ac_unit_outlined,
                      size: 10,
                    ),
                  ),
                  Text("容器")
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 118),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: list[index],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
