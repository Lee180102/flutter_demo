import 'package:flutter/material.dart';

import 'bean/trace.dart';

class TracePage extends StatefulWidget {
  List<Map<String,dynamic>> list = [
    {
      "businessTypeName": "新建容器",
      "businessTime": "2020-12-17 14:51:19",
      "itemList": [
        {
          "value": {
            "name": "损伤性垃圾袋",
            "uuid": "103950020050120201118000001"
          },
          "key": {
            "fieldName": "containerTypeUuid",
            "fieldComments": "容器类型"
          }
        },
        {
          "value": {
            "name": "总务科（损伤）",
            "uuid": "103950010050120201118000005"
          },
          "key": {
            "fieldName": "producePlaceUuid",
            "fieldComments": "产生位置"
          }
        },
        {
          "value": {
            "name": "2020-12-17 14:51:19",
            "uuid": "2020-12-17 14:51:19"
          },
          "key": {
            "fieldName": "createTime",
            "fieldComments": "创建时间"
          }
        },
        {
          "value": {
            "name": "waste01",
            "uuid": "103900180050120201208000001"
          },
          "key": {
            "fieldName": "createUserUuid",
            "fieldComments": "创建人"
          }
        }
      ]
    },
    {
      "businessTypeName": "删除容器",
      "businessTime": "2020-12-17 14:51:19",
      "itemList": [
        {
          "value": {
            "name": "损伤性垃圾袋",
            "uuid": "103950020050120201118000001"
          },
          "key": {
            "fieldName": "containerTypeUuid",
            "fieldComments": "容器类型"
          }
        },
        {
          "value": {
            "name": "总务科（损伤）",
            "uuid": "103950010050120201118000005"
          },
          "key": {
            "fieldName": "producePlaceUuid",
            "fieldComments": "产生位置"
          }
        },
        {
          "value": {
            "name": "2020-12-17 14:51:19",
            "uuid": "2020-12-17 14:51:19"
          },
          "key": {
            "fieldName": "createTime",
            "fieldComments": "创建时间"
          }
        },
        {
          "value": {
            "name": "waste01",
            "uuid": "103900180050120201208000001"
          },
          "key": {
            "fieldName": "createUserUuid",
            "fieldComments": "创建人"
          }
        }
      ]
    }
  ];
  TracePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TracePageState();
  }



}

class _TracePageState extends State<TracePage> {
  List<Trace> _listTrace = new List();


  @override
  void initState() {
    super.initState();
    _listTrace = Trace.allFromJson(widget.list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aaa"),
      ),
      body: ListView.builder(
          itemCount: _listTrace.length,
          itemBuilder: (BuildContext context, int index) {
            return Text(_listTrace[index].businessTypeName);
          }),
    );
  }
}
