import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DoubleInput.dart';

class DoubleTextField extends StatefulWidget {
  DoubleTextField({Key key}) : super(key: key);

  @override
  _DoubleTextFieldState createState() {
    return _DoubleTextFieldState();
  }
}

class _DoubleTextFieldState extends State<DoubleTextField> {
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
    return TextField(
      keyboardType: TextInputType.number,
      enableInteractiveSelection: false,
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9.]")), LengthLimitingTextInputFormatter(9), DoubleInputFormatter(4)],
      onSubmitted: (v) {
        if (v == "0.") {
          _textEditingController.text = "0";
        } else {
          _textEditingController.text = double.parse(v).toString();
        }
      },
      controller: _textEditingController,
    );
  }
}
