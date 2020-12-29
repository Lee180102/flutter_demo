import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/chip/actor_action_chip.dart';
import 'package:flutter_demo/widget/chip/actor_choice_chip.dart';
import 'package:flutter_demo/widget/chip/actor_input_chip.dart';
import 'package:flutter_demo/widget/transition/transition_list.dart';

import 'list_two_class/list_two_class.dart';
import 'list_two_class/list_two_class_route.dart';
import 'loading_dialog/loading_dialog.dart';

class WidgetList extends StatefulWidget {
  WidgetList({Key key}) : super(key: key);

  @override
  _WidgetListState createState() {
    return _WidgetListState();
  }
}

class _WidgetListState extends State<WidgetList> {
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
        title: Text("Demo List"),
      ),
      body: ListView(
        children: [
          RaisedButton(child:Text("LoadingDialog"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> LoadingDialog()))),
          RaisedButton(child:Text("ListTwoClass"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ListTwoClassRoute()))),
        ],
      ),
    );
  }
}

