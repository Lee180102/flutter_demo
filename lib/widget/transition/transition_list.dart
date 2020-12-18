import 'package:flutter/material.dart';

import 'animated_widge/animated_container.dart';
import 'basic_transition/basic_transition.dart';
import 'grow_transition/grow_transition_route.dart';

class TransitionList extends StatefulWidget {
  TransitionList({Key key}) : super(key: key);

  @override
  _TransitionListState createState() {
    return _TransitionListState();
  }
}

class _TransitionListState extends State<TransitionList> {
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
          RaisedButton(child:Text("BasicTransition"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> BasicTransition()))),
          RaisedButton(child:Text("AnimatedContainer"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> AnimatedContainerRoute()))),
          RaisedButton(child:Text("GrowTransitionRoute"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> GrowTransitionRoute()))),
        ],
      ),
    );
  }
}
