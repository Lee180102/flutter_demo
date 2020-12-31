import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/transition/route_transition/android_route_transition_route.dart';

class Demo01 extends StatefulWidget {
  Demo01({Key key}) : super(key: key);

  @override
  _Demo01State createState() => _Demo01State();
}

class _Demo01State extends State<Demo01> with SingleTickerProviderStateMixin {
  AnimationController controller;
  GlobalKey<_Demo01State> key;
  GlobalKey<_Demo01State> key2;
  double start = 0;
  double moveMaxLength = 160;
  bool isOpen;

  @override
  void initState() {
    super.initState();
    //初始化动画，让item可以实现自动滑动
    controller = new AnimationController(lowerBound: 0, upperBound: moveMaxLength, duration: const Duration(milliseconds: 300), vsync: this)
      ..addListener(() {
        start = controller.value;
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Stack"),
        ),
        body: ListView(
          children: [
            GestureDetector(
              onHorizontalDragDown: (DragDownDetails details) {
                //滑动开始的时候关闭打开的item
                close();
                // return widget.onStart();
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                //滑动中更新滑动距离
                setState(() {
                  start -= details.delta.dx;
                  if (start <= 0) {
                    //限制最小滑动距离
                    start = 0;
                  }

                  if (start >= moveMaxLength) {
                    //限制最大滑动距离
                    start = moveMaxLength;
                  }
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                controller.value = start; //滑动结束的时候给动画value赋值为当前值
                if (start == moveMaxLength)
                  isOpen = true; //滑动距离最大的时候即为打开状态
                else if (start > moveMaxLength / 2) {
                  //滑动超过一般距离的时候，启动动画滑动到最大位置
                  controller.animateTo(moveMaxLength);
                  isOpen = true;
                } else if (start <= moveMaxLength / 2) {
                  //往回滑动超过一般距离的时候，启动动画滑动到初始位置
                  close();
                }
              },
              child: Container(
                height: 115,
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      right: 80,
                      child: InkWell(
                        onTap: () {
                          // widget.change(widget.position);
                          print("修改");
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          alignment: Alignment.center,
                          color: Colors.grey,
                          child: Text(
                            "修改",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          // widget.delete(widget.position);
                          print("删除");
                        },
                        child: Container(
                          width: 80,
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text(
                            "删除",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -start,
                      right: start,
                      child: Container(
                        color: Colors.blue,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text("item"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onHorizontalDragDown: (DragDownDetails details) {
                //滑动开始的时候关闭打开的item
                close();
                // return widget.onStart();
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                //滑动中更新滑动距离
                setState(() {
                  start -= details.delta.dx;
                  if (start <= 0) {
                    //限制最小滑动距离
                    start = 0;
                  }

                  if (start >= moveMaxLength) {
                    //限制最大滑动距离
                    start = moveMaxLength;
                  }
                });
              },
              onHorizontalDragEnd: (DragEndDetails details) {
                controller.value = start; //滑动结束的时候给动画value赋值为当前值
                if (start == moveMaxLength)
                  isOpen = true; //滑动距离最大的时候即为打开状态
                else if (start > moveMaxLength / 2) {
                  //滑动超过一般距离的时候，启动动画滑动到最大位置
                  controller.animateTo(moveMaxLength);
                  isOpen = true;
                } else if (start <= moveMaxLength / 2) {
                  //往回滑动超过一般距离的时候，启动动画滑动到初始位置
                  close();
                }
              },
              child: Container(
                height: 115,
                padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      right: 80,
                      child: InkWell(
                        onTap: () {
                          // widget.change(widget.position);
                          print("修改");
                        },
                        child: Container(
                          width: 80,
                          height: 100,
                          alignment: Alignment.center,
                          color: Colors.grey,
                          child: Text(
                            "修改",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          // widget.delete(widget.position);
                          print("删除");
                        },
                        child: Container(
                          width: 80,
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: Text(
                            "删除",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -start,
                      right: start,
                      child: Container(
                        color: Colors.blue,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text("item"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void close() {
    controller.animateTo(0);
    isOpen = false;
  }
}
