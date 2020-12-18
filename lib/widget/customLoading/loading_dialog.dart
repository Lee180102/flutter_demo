import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class LoadingDialog extends StatefulWidget {
  LoadingDialog({Key key}) : super(key: key);

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> with SingleTickerProviderStateMixin {
  Animation  animation;
  Animation<Color> colorAnimation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() => {});
      });
    colorAnimation = new ColorTween(begin: Colors.blue, end: Colors.amber).animate(animation)
      ..addListener(() {
        setState(() => {});
      });
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Dialog"),
      ),
      body: Container(
        child: Column(
          children: [
            MaterialButton(
                child: Text("Start"),
                onPressed: () {
                  //启动动画(正向执行)
                  controller.forward();
                }),
            MaterialButton(
                child: Text("Stop"),
                onPressed: () {
                  controller.stop();
                }),
            MaterialButton(
                child: Text("Stop"),
                onPressed: () {
                  controller.reverse();
                }),
            Text("Loading"),
            Container(
              width: animation.value,
              height: animation.value,
              color: colorAnimation.value,
            )
          ],
        ),
      ),
    );
  }
}
