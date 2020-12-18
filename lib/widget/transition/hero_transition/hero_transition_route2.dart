import 'package:flutter/material.dart';

class HeroTransitionRoute2 extends StatefulWidget {
  HeroTransitionRoute2({Key key}) : super(key: key);

  @override
  _HeroTransitionRoute2State createState() => _HeroTransitionRoute2State();
}

class _HeroTransitionRoute2State extends State<HeroTransitionRoute2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeroRoute2"),
      ),
      body: ListView(
        children: [
          Center(
            child: Text("I'm Hero NO.2"),
          ),
          Center(
            child: Hero(
              tag: "avatar",
              child: Image.asset("assets/images/avatar.png"),
            ),
          ),
        ],
      ),
    );
  }
}
