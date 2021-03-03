import 'package:flutter/material.dart';
import 'package:flutter_demo/study/CustomPaint%E7%94%BB%E5%9B%BE/custom_paint_page.dart';

class StudyListPage extends StatefulWidget {
  StudyListPage({Key key}) : super(key: key);

  @override
  _StudyListPageState createState() => _StudyListPageState();
}

class _StudyListPageState extends State<StudyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("组件学习练习"),
      ),
      body: ListView(
        children: [
          RaisedButton(child: Text("CustomPaint画图"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CustomPaintPage()))),
        ],
      ),
    );
  }
}