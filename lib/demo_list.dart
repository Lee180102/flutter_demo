import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/chip/actor_action_chip.dart';
import 'package:flutter_demo/widget/chip/actor_choice_chip.dart';
import 'package:flutter_demo/widget/chip/actor_input_chip.dart';
import 'package:flutter_demo/widget/dismissable/dismissable_route.dart';
import 'package:flutter_demo/widget/scaffold/scaffold_route.dart';
import 'package:flutter_demo/widget/signature/signature_demo.dart';
import 'package:flutter_demo/widget/transition/transition_list.dart';

import 'custom_widget/chip/wrap_choice_chip/test.dart';
import 'demo/getWidget/get_widget_value.dart';
import 'demo/remove_item/demo01.dart';
import 'demo/remove_item/remove_item_route.dart';
import 'demo/remove_item/slide_button_route.dart';
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
          RaisedButton(child:Text("SignatureDemo"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SignatureDemo()))),
          RaisedButton(child:Text("GetWidget"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> GetWidgetValue()))),
          RaisedButton(child:Text("ScaffoldRoute"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> ScaffoldRoute()))),
          RaisedButton(child:Text("DismissableRoute"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> DismissableRoute1()))),
          RaisedButton(child:Text("RemoveItemRoute"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> RemoveItemRoute()))),
          RaisedButton(child:Text("SlideButtonRoute"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> SlideButtonRoute()))),
          RaisedButton(child:Text("Demo01"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Demo01()))),
        ],
      ),
    );
  }
}

