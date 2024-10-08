import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_widget/check_box/check_box_page.dart';
import 'package:flutter_demo/custom_widget/double_input/double_input_page.dart';
import 'package:flutter_demo/test/navigator/navigator_no1.dart';
import 'package:flutter_demo/widget/chip/actor_action_chip.dart';
import 'package:flutter_demo/widget/chip/actor_choice_chip.dart';
import 'package:flutter_demo/widget/chip/actor_input_chip.dart';
import 'package:flutter_demo/widget/dismissable/dismissable_route.dart';
import 'package:flutter_demo/widget/scaffold/scaffold_route.dart';
import 'package:flutter_demo/widget/signature/signature_demo.dart';
import 'package:flutter_demo/widget/transition/transition_list.dart';

import 'custom_widget/chip/wrap_choice_chip/test.dart';
import 'demo/datetime_picker/datetime_picker.dart';
import 'demo/getWidget/get_widget_value.dart';
import 'demo/localizations/localization_demo_page.dart';
import 'demo/remove_item/demo01.dart';
import 'demo/remove_item/remove_item_route.dart';
import 'demo/remove_item/slide_button_route.dart';
import 'demo/time_line/my_journey_page.dart';
import 'demo/time_line/project_demo/trace_page.dart';
import 'demo/time_line/time_line_route.dart';
import 'widget/chip/filter_chip_demo.dart';
import 'package:flutter_demo/image/image_list.dart';
import 'image/image_picker_demo.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo List"),
      ),
      body: ListView(
        children: [
          RaisedButton(child: Text("FilterChipDemo1"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FilterChipDemo()))),
          RaisedButton(child: Text("InputChipDemo1"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ActorInputChip()))),
          RaisedButton(child: Text("ChoiceChipDemo1"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ActorChoiceChip()))),
          RaisedButton(child: Text("ActionChipDemo1"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ActorActionChip()))),
          RaisedButton(child: Text("SingleChoiceChipTest"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SingleChoiceChipTest()))),
          RaisedButton(child: Text("Transition"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TransitionList()))),
          RaisedButton(child: Text("SignatureDemo"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignatureDemo()))),
          RaisedButton(child: Text("GetWidget"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => GetWidgetValue()))),
          RaisedButton(child: Text("ScaffoldRoute"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ScaffoldRoute()))),
          RaisedButton(child: Text("DismissableRoute"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DismissableRoute1()))),
          RaisedButton(child: Text("RemoveItemRoute"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RemoveItemRoute()))),
          RaisedButton(child: Text("SlideButtonRoute"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SlideButtonRoute()))),
          RaisedButton(child: Text("Demo01"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Demo01()))),
          RaisedButton(child: Text("TimeLineRoute"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TimeLineRoute()))),
          RaisedButton(child: Text("MyJourneyPageTest"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyJourneyPageTest()))),
          RaisedButton(child: Text("TracePage"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TracePage()))),
          RaisedButton(child: Text("DatetimePicker"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DatetimePicker()))),
          RaisedButton(child: Text("DoubleInputPage"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DoubleInputPage()))),
          RaisedButton(child: Text("国际化测试"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LocalizationDemoPage()))),
          RaisedButton(child: Text("路由管理"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavigatorNo1()))),
          RaisedButton(child: Text("圆形复选框"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CheckBoxPage()))),
          RaisedButton(child: Text("图片展示"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ImageList()))),
          RaisedButton(child: Text("照相"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ImagePickerDemo()))),

        ],
      ),
    );
  }
}
