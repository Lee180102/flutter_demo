import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/localizations/demo_localizations.dart';

class LocalizationDemoPage extends StatefulWidget {
  LocalizationDemoPage({Key key}) : super(key: key);

  @override
  _LocalizationDemoPageState createState() => _LocalizationDemoPageState();
}

class _LocalizationDemoPageState extends State<LocalizationDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoLocalizations.of(context).title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text("切换系统语言，标题改变"),
      ),
    );
  }
}