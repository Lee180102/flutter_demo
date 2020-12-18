import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation ,
        child: child,
        builder: (BuildContext context ,Widget child){
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      )
    );
  }
}
