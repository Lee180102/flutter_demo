import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/customLoading/grow_ransition/grow_transition.dart';

class GrowTransitionRoute extends StatefulWidget {
  GrowTransitionRoute({Key key}) : super(key: key);

  @override
  _GrowTransitionRouteState createState() => _GrowTransitionRouteState();
}

class _GrowTransitionRouteState extends State<GrowTransitionRoute> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    //路由销毁时需要释放动画资源
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grow Transition"),),
      body: GrowTransition(
        child: Container(color: Colors.amber,),
        animation: animation,
      ),
    );
  }
}