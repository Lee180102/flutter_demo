import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/custom_widget/double_input/double_text_field.dart';

import 'DoubleInput.dart';

class DoubleInputPage extends StatefulWidget {
  DoubleInputPage({Key key}) : super(key: key);

  @override
  _DoubleInputPageState createState() {
    return _DoubleInputPageState();
  }
}

class _DoubleInputPageState extends State<DoubleInputPage> {


  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            enableInteractiveSelection: false,
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp("[0-9.]")),
              LengthLimitingTextInputFormatter(9),
              DoubleInputFormatter(4)],
            onSubmitted: (v){
              if (v=="0.") {
                _textEditingController.text = "0";
              }
            },
            controller: _textEditingController,
          ),
          DoubleTextField(),
        ],
      ),
    );
  }
}