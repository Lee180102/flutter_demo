import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/chip/actor_action_chip.dart';
import 'package:flutter_demo/widget/chip/actor_choice_chip.dart';
import 'package:flutter_demo/widget/chip/actor_input_chip.dart';
import 'package:flutter_demo/widget/transition/transition_list.dart';

import 'custom_widget/chip/wrap_choice_chip/test.dart';
import 'widget/chip/filter_chip_demo.dart';

class DemoList extends StatefulWidget {
  DemoList({Key key}) : super(key: key);

  @override
  _DemoListState createState() {
    return _DemoListState();
  }
}

class _DemoListState extends State<DemoList> {
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
        title: Text("Demo List"),
      ),
      body: ListView(
        children: [
          RaisedButton(child:Text("FilterChipDemo1"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> FilterChipDemo()))),
          RaisedButton(child:Text("InputChipDemo1"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ActorInputChip()))),
          RaisedButton(child:Text("ChoiceChipDemo1"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ActorChoiceChip()))),
          RaisedButton(child:Text("ActionChipDemo1"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ActorActionChip()))),
          RaisedButton(child:Text("SingleChoiceChipTest"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SingleChoiceChipTest()))),
          RaisedButton(child:Text("Transition"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> TransitionList()))),
        ],
      ),
    );
  }
}

