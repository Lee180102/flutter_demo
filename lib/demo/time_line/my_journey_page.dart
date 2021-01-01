import 'package:flutter/material.dart';

class MyJourneyPageTest extends StatefulWidget {
  static const routeName = 'MyJourneyPageTest';
  Map<String, dynamic> jsonData = {
    "result": 0,
    "description": "操作成功",
    "list": [
      {
        "timeLine": "2020-05-20",
        "journeyList": [
          {
            "place": "华山论剑",
            "templateText": "Flutter —— 时间轴 实现，自定义点边框PointBorder 这一天，我完成了",
          },
          {"place": "华山煮茶", "templateText": "这一天，我完成了"}
        ]
      },
      {
        "timeLine": "2020-05-19",
        "journeyList": [
          {
            "place": "泰山悟道",
            "templateText": "Flutter —— 时间轴 实现，自定义点边框PointBorder 这一天，我完成了",
          },
          {
            "place": "泰山喝茶",
            "templateText": "这一天，我完成了",
          }
        ]
      },
      {
        "timeLine": "2020-05-10",
        "journeyList": [
          {
            "place": "嵩山比武",
            "templateText": "Flutter —— 时间轴 实现，自定义点边框PointBorder 这一天，我完成了",
          },
          {
            "place": "嵩山习武",
            "templateText": "Flutter —— 时间轴 实现，自定义点边框PointBorder 这一天，我完成了",
          }
        ]
      },
      {
        "timeLine": "2020-05-09",
        "journeyList": [
          {
            "place": "衡山打酱油",
            "templateText": "Flutter —— 时间轴 实现，自定义点边框PointBorder 这一天，我完成了",
          }
        ]
      }
    ],
  };

  @override
  State<StatefulWidget> createState() => _MyJourneyPageState();
}

class _MyJourneyPageState extends State<MyJourneyPageTest> {
  JourneyBean _journeyResultBean;
  List<JourneyTimeLine> _listJourneyTimeLine = [];
  bool isEmpty = false;

  bool isLoading = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _journeyResultBean = JourneyBean.fromJson(widget.jsonData);
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    _listJourneyTimeLine.addAll(_journeyResultBean.list);
    _listJourneyTimeLine.add(_journeyResultBean.list[0]);
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.green,
          height: 150,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
              child: AppBar(
                elevation: 0,
                centerTitle: true,
                title: Text(
                  '我的旅程',
                ),
                backgroundColor: Colors.green,
              ),
              preferredSize: Size.fromHeight(40.0)),
          body: Card(
            margin: EdgeInsets.only(top: 30, left: 15.0, right: 15.0, bottom: 15.0),
            color: Colors.white,
            child: _getMainContainer(),
          ),
        ),
      ],
    );
  }

  _getMainContainer() {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listJourneyTimeLine.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              // 顶部的点
              mainAxisAlignment: MainAxisAlignment.start,
              children: [1, 2, 3].map((ite) {
                return Container(
                  // 点
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    radius: 2,
                  ),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 21, right: 10, top: (ite == 1 ? 3 : 8)), // 区别间距
//                    color: Color(0x36FFA726),
                );
              }).toList(),
            );
          } else {
            return _detailView(_listJourneyTimeLine[index]);
          }
        },
      ),
    );
  }

  // 旅程详情
  _detailView(JourneyTimeLine timeLine) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // 日期行 ， 点+日期
        Row(
          children: <Widget>[
            Container(
              // 点
              child: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                radius: 6,
              ),
              alignment: Alignment.center,
              width: 30,
              margin: EdgeInsets.only(left: 8, right: 3),
            ),
            Text(
              // 日期
              dateChane(timeLine.timeLine),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        // 单个日期具体行程
        _detailView2(timeLine),
      ],
    );
  }

  // 单个日期具体行程
  _detailView2(JourneyTimeLine timeLine) {
    return Row(
      children: <Widget>[
        Container(
          // 点
          child: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            radius: 2,
          ),
          alignment: Alignment.center,
          width: 30,
          margin: EdgeInsets.only(left: 8, right: 3),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            left: 0,
            top: 1,
          ),
          padding: EdgeInsets.only(top: 0, bottom: 8),
          color: Colors.blue[100],
          child: Text("稍后实现具体日期的游玩列表"),
        )
      ],
    );
  }
}

/// 时间日期转化
String dateChane(String timeLine) {
  print('walke MyJourneyPageState._dateChane() -----> $timeLine');
  List<String> dlist = timeLine.split('-');
  if (dlist == null || dlist.length == 0) return timeLine;
  int month = int.parse(dlist[1]); //
  int day = int.parse(dlist[2]);
  return dlist[0] + '年' + month.toString() + '月' + day.toString() + '日';
}

class JourneyBean {
  int result;
  String description;
  List<JourneyTimeLine> list;

  JourneyBean.fromJson(Map<String, dynamic> json)
      : result = json["result"],
        description = json["description"],
        list = JourneyTimeLine.allFromJson(json["list"]);
}

class JourneyTimeLine {
  String timeLine;
  List<Journey> journeyList;

  JourneyTimeLine.fromJson(Map<String, dynamic> json)
      : timeLine = json["timeLine"],
        journeyList = Journey.allFromJson(json["journeyList"]);

  static List<JourneyTimeLine> allFromJson(List jsonList) {
    return jsonList.map((json) => JourneyTimeLine.fromJson(json)).toList();
  }
}

class Journey {
  String place;
  String templateText;

  Journey.fromJson(Map<String, dynamic> json)
      : place = json["place"],
        templateText = json["templateText"];

  static List<Journey> allFromJson(List jsonList) {
    return jsonList.map((json) => Journey.fromJson(json)).toList();
  }
}
