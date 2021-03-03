import 'package:flutter/cupertino.dart';

class DemoLocalizations {

  DemoLocalizations(this.isZh);

  bool isZh = false;

  static DemoLocalizations of (BuildContext context){
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }
}