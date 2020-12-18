
import 'package:flutter/material.dart';

import 'actor_filter_chip.dart';

class FilterChipDemo extends StatefulWidget {
  FilterChipDemo({Key key}) : super(key: key);

  @override
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<FilterChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter chip"),
      ),
      body: Container(
        child: CastFilter(),
      ),
    );
  }
}