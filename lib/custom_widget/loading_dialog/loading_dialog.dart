import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  LoadingDialog({Key key}) : super(key: key);

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading Dialog"),
      ),
      body: Column(
        children: [
          RaisedButton(
              child: Text("Start"),
              onPressed: () {
                showLoadingDialog();
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.of(context).pop();
                });
              })
        ],
      ),
    );
  }

  showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                    padding: const EdgeInsets.only(top: 26.0),
                    child: Container(
                        child: Text('登录中……',
                            style: TextStyle(fontSize: 15, color: Colors.white70, decoration: TextDecoration.none))
                    )
                )
              ],
            ),
          ),
          onWillPop: () => Future.value(false),
        );
      },
    );
  }
}
