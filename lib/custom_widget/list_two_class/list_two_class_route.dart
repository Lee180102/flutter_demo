import 'package:flutter/material.dart';

import 'list_two_class.dart';

class ListTwoClassRoute extends StatefulWidget {
  ListTwoClassRoute({Key key}) : super(key: key);

  @override
  _ListTwoClassRouteState createState() {
    return _ListTwoClassRouteState();
  }
}

class _ListTwoClassRouteState extends State<ListTwoClassRoute> {
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("二级列表"),
      ),
      body: Container(
        child: ListTwoClass(),
      ),
    );
  }
}