import 'package:flutter/material.dart';

class DialogList extends StatefulWidget {
  DialogList({Key key}) : super(key: key);

  @override
  _DialogListState createState() => _DialogListState();
}

class _DialogListState extends State<DialogList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog List"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(child: Text("对话框打开动画及遮罩"), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
