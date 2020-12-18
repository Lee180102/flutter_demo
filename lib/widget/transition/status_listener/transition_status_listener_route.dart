import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/transition/status_listener/transition_status_listener.dart';

class TransitionStatusListenerRoute extends StatefulWidget {
  @override
  _TransitionStatusListenerRouteState createState() => _TransitionStatusListenerRouteState();
}

class _TransitionStatusListenerRouteState extends State<TransitionStatusListenerRoute> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = new AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    //图片宽高从0变到300
    _animation = new Tween(begin: 0.0, end: 300.0).animate(_controller);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        _controller.forward();
      }
    });

    //启动动画（正向）
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grow Transition"),),
      body: TransitionStatusListener(
        child: Container(color: Colors.amber,),
        animation: _animation,
      ),
    );
  }
}
