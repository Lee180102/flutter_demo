import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/transition/stagger_transition/stagger_transition_animation.dart';

class StaggerTransitionRoute extends StatefulWidget {
  StaggerTransitionRoute({Key key}) : super(key: key);

  @override
  _StaggerTransitionRouteState createState() => _StaggerTransitionRouteState();
}

class _StaggerTransitionRouteState extends State<StaggerTransitionRoute> with TickerProviderStateMixin  {

  AnimationController _controller;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this
    );
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stagger Transition Route"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              )
            ),
            child: StaggerTransitionAnimation(controller: _controller,),
          ),
        ),
      ),
    );
  }
}