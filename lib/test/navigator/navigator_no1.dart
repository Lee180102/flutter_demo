import 'package:flutter/material.dart';
import 'package:flutter_demo/main.dart';
import 'package:flutter_demo/test/navigator/navigator_no2.dart';

class NavigatorNo1 extends StatefulWidget {
  NavigatorNo1({Key key}) : super(key: key);

  @override
  _NavigatorNo1State createState() => _NavigatorNo1State();
}

class _NavigatorNo1State extends State<NavigatorNo1>  with RouteAware{

  String text = "路由1前";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由1"),
      ),
      body: Container(
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NavigatorNo2()));
          },
          child: Text(text),
        ),
      ),
    );
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }


  @override
  void didPush() {
    print("didPush No.1");
  }

  @override
  void didPushNext() {
    // TODO: implement didPushNext
    super.didPushNext();
    print("didPushNext No.1");
  }

  @override
  void didPop() {
    // TODO: implement didPop
    super.didPop();
    print("didPop No.1");

  }
  @override
  void didPopNext() {
    print("didPopNext No.1");
  }
}
