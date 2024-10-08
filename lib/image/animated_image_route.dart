import 'dart:io';

import 'package:flutter/material.dart';

class AnimatedImageRoute extends StatefulWidget {
  AnimatedImageRoute({Key key, @required this.file}) : super(key: key);

  File file;

  @override
  _AnimatedImageRouteState createState() {
    return _AnimatedImageRouteState();
  }
}

class _AnimatedImageRouteState extends State<AnimatedImageRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 618), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 500.0).animate(controller);
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
        appBar: AppBar(
          title: Text("Widget"),
        ),
        body: AnimatedBuilder(
          animation: animation,
          child: GestureDetector(
            onDoubleTap: () async {
              await controller.reverse();
              Navigator.of(context).pop();
            },
            child: Image.file(widget.file),
          ),
          builder: (BuildContext context, Widget child) {
            return Center(
              child: Container(
                height: animation.value,
                width: animation.value,
                child: child,
              ),
            );
          },
        ));
  }
}
