import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/transition/hero_transition/hero_transition_route2.dart';

class HeroTransitionRoute1 extends StatefulWidget {
  HeroTransitionRoute1({Key key}) : super(key: key);

  @override
  _HeroTransitionRoute1State createState() => _HeroTransitionRoute1State();
}

class _HeroTransitionRoute1State extends State<HeroTransitionRoute1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeroRoute1"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("I'm Hero NO.1"),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: InkWell(
              child: Hero(
                tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/avatar.png",
                    width: 50.0,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: HeroTransitionRoute2(),
                  );
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
