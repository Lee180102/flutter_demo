import 'package:flutter/material.dart';

class AndroidRouteTransitionRoute extends StatefulWidget {
  AndroidRouteTransitionRoute({Key key}) : super(key: key);

  @override
  _AndroidRouteTransitionRouteState createState() => _AndroidRouteTransitionRouteState();
}

class _AndroidRouteTransitionRouteState extends State<AndroidRouteTransitionRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo List"),
      ),
      body: ListView(
        children: [
          RaisedButton(child: Text("BasicTransition"), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AndroidRouteTransitionLeafRoute()))),
        ],
      ),
    );
  }
}

class AndroidRouteTransitionLeafRoute extends StatefulWidget {
  AndroidRouteTransitionLeafRoute({Key key}) : super(key: key);

  @override
  _AndroidRouteTransitionLeafRouteState createState() {
    return _AndroidRouteTransitionLeafRouteState();
  }
}

class _AndroidRouteTransitionLeafRouteState extends State<AndroidRouteTransitionLeafRoute> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Demo List"),
        ),
        body: Text("AndroidRouteTransition"));
  }
}
