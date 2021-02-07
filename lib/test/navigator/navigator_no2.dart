import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';

class NavigatorNo2 extends StatefulWidget {
  NavigatorNo2({Key key}) : super(key: key);

  @override
  _NavigatorNo2State createState() => _NavigatorNo2State();
}

class _NavigatorNo2State extends State<NavigatorNo2> with RouteAware{
  String text = "路由2前";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由1"),
      ),
      body: Container(
        child: Text(text),
      ),
    );
  }

  change() {
    setState(() {
      text = "路由器2后";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    routeObserver.subscribe(this, ModalRoute.of(context));

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  /// RouteAware
  @override
  void didPush() {
    print("didPush No.2");
    // Route was pushed onto navigator and is now topmost route.
  }

  @override
  void didPushNext() {
    // TODO: implement didPushNext
    super.didPushNext();
    print("didPushNext No.2");
  }

  @override
  void didPop() {
    // TODO: implement didPop
    super.didPop();
    print("didPop No.2");

  }
  @override
  void didPopNext() {
    print("didPopNext No.2");

    // Covering route was popped off the navigator.
  }
}