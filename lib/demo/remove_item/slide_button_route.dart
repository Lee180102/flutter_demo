import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/remove_item/slide_button.dart';

class SlideButtonRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SlideButtonRouteState();
  }
}

class _SlideButtonRouteState extends State<SlideButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SlideButton"),
      ),
      body: ListView(
        children: getSlides(),
      ),
    );
  }

  List<SlideButton> list;

  List<SlideButton> getSlides() {
    list = List<SlideButton>();
    for (var i = 0; i < 10; i++) {
      var key = GlobalKey<SlideButtonState>();
      var slide = SlideButton(
        key: key,
        singleButtonWidth: 80,
        onSlideStarted: () {
          list.forEach((slide) {
            if (slide.key != key) {
              slide.key.currentState?.close();
            }
          });
        },
        child: Container(
          color: Colors.white,
          child: ListTile(
            title: Text("测试测试测试测试测试测试测试测试"),
          ),
        ),
        buttons: <Widget>[
          buildAction(key, "置顶", Colors.grey[400], () {
            print("置顶");
            key.currentState.close();
          }),
          buildAction(key, "标为未读", Colors.amber, () {
            print("标为未读");

            // Fluttertoast.showToast(msg: "标为未读");
            key.currentState.close();
          }),
          buildAction(key, "删除", Colors.red, () {
            print("删除");

            // Fluttertoast.showToast(msg: "删除");
            key.currentState.close();
          }),
        ],
      );
      list.add(slide);
    }
    return list;
  }

  InkWell buildAction(GlobalKey<SlideButtonState> key, String text, Color color, GestureTapCallback tap) {
    return InkWell(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        width: 80,
        color: color,
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
