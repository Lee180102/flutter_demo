import 'package:flutter/material.dart';

class AnimatedContainer extends AnimatedWidget{
  AnimatedContainer({Key key,Animation<double> animation,}):super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Container(
      child: Container(
        width: animation.value,
        height: animation.value,
        color: Colors.amber,
      ),
    );
  }
}
class AnimatedContainerRoute extends StatefulWidget {
  AnimatedContainerRoute({Key key}) : super(key: key);

  @override
  _AnimatedContainerRouteState createState() {
    return _AnimatedContainerRouteState();
  }
}

class _AnimatedContainerRouteState extends State<AnimatedContainerRoute> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
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
      appBar: AppBar(
        title: Text("Widget"),
      ),
      body: AnimatedContainer(animation: animation,)
    );
  }
}


