import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/transition/route_transition/android_route_transition_route.dart';
import 'package:flutter_demo/widget/transition/stagger_transition/stagger_transition_route.dart';
import 'package:flutter_demo/widget/transition/status_listener/transition_status_listener_route.dart';

import 'animated_swicher/animated_switcher_counter_route.dart';
import 'animated_widge/animated_container.dart';
import 'basic_transition/basic_transition.dart';
import 'grow_transition/grow_transition_route.dart';
import 'hero_transition/hero_transition_route1.dart';

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
          RaisedButton(child:Text("TransitionStatusListenerRoute"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> TransitionStatusListenerRoute()))),
          RaisedButton(child:Text("AndroidRouteTransitionRoute"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> AndroidRouteTransitionRoute()))),
          RaisedButton(child:Text("HeroTransitionRoute1"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> HeroTransitionRoute1()))),
          RaisedButton(child:Text("StaggerTransitionRoute"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> StaggerTransitionRoute()))),
          RaisedButton(child:Text("AnimatedSwitcherCounterRoute"),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> AnimatedSwitcherCounterRoute()))),
        ],
      ),
    );
  }
}
