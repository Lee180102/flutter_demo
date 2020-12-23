import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
class SignatureDemo extends StatefulWidget {
  SignatureDemo({Key key}) : super(key: key);

  @override
  _SignatureDemoState createState() {
    return _SignatureDemoState();
  }
}

class _SignatureDemoState extends State<SignatureDemo> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );


  @override
  void initState() {
    super.initState();
    _controller.addListener(() => print("Value changed"));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Signature Demo"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: Center(
              child: Text('Big container to test scrolling issues'),
            ),
          ),
          //SIGNATURE CANVAS
          Signature(
            controller: _controller,
            height: 300,
            backgroundColor: Colors.lightBlueAccent,
          ),
          //OK AND CLEAR BUTTONS
          Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //SHOW EXPORTED IMAGE IN NEW ROUTE
                IconButton(
                  icon: const Icon(Icons.check),
                  color: Colors.blue,
                  onPressed: () async {
                    if (_controller.isNotEmpty) {
                      var data = await _controller.toPngBytes();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(),
                              body: Center(
                                  child: Container(
                                      color: Colors.grey[300], child: Image.memory(data))),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                //CLEAR CANVAS
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() => _controller.clear());
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            child: Center(
              child: Text('Big container to test scrolling issues'),
            ),
          ),
        ],
      ),
    );
  }
}