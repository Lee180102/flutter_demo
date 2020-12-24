import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetWidgetValue extends StatefulWidget {
  GetWidgetValue({Key key}) : super(key: key);

  @override
  _GetWidgetValueState createState() {
    return _GetWidgetValueState();
  }
}

class _GetWidgetValueState extends State<GetWidgetValue> {
  List<String> wid = ["String", "int"];

  Map<String, dynamic> result = {};

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
        title: Text("获取组件"),
      ),
      body: ListView.builder(
        itemCount: wid.length,
        itemBuilder: (BuildContext context, int index) {
          String type = wid[index];
          return WidgetSwitch(type: type, result: result,resultKey: type,);
        },
      ),
      persistentFooterButtons: <Widget>[
        MaterialButton(
            onPressed: () => {
                  result.forEach((key, value) {
                    print(key + ": " + value.toString());
                  })
                },
            child: Icon(Icons.refresh)),
      ],
    );
  }
}

class WidgetSwitch extends StatelessWidget {
  WidgetSwitch({Key key, @required this.type, @required this.result, @required this.resultKey}) : super(key: key);

  Map<String, dynamic> result = {};
  final String type;
  final String resultKey;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "String":
        return TextField(
          onChanged: (value) {
            result[resultKey] = value;
          },
        );
        break;
      case "int":
        return TextField(
          inputFormatters: [LengthLimitingTextInputFormatter(20), FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          onChanged: (value) {
            result[resultKey] = value;
          },
        );
        break;
    }
    return Container();
  }
}
