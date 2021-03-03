import 'package:flutter/material.dart';

class TestListPage extends StatefulWidget {
  TestListPage({Key key}) : super(key: key);

  @override
  _TestListPageState createState() {
    return _TestListPageState();
  }
}

class _TestListPageState extends State<TestListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("组件测试"),
      ),


    );
  }
}