import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_widget/check_box/ace_check_box.dart';
import 'package:flutter_demo/custom_widget/check_box/custom_check_box.dart';

class CheckBoxPage extends StatefulWidget {
  CheckBoxPage({Key key}) : super(key: key);

  @override
  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool state = true;
  Object _triState;
  bool aceState = true;
  Object _triAceState;
  bool testState = true;
  Object _triTestState;

  bool myState = true;
  Object _triMyState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("圆形复选框"),
      ),
      body: Container(
        child: Column(
          children: [
            // Row(
            //   children: [
            //     Container(
            //       child: Text("CheckBox:"),
            //       width: 100,
            //     ),
            //     Checkbox(value: state, onChanged: (value) => setState(() => state = value)),
            //     Checkbox(value: state, checkColor: Colors.purpleAccent.withOpacity(0.7), onChanged: (value) => setState(() => state = value)),
            //     Checkbox(value: state, activeColor: Colors.teal.withOpacity(0.3), checkColor: Colors.purpleAccent.withOpacity(0.7), onChanged: (value) => setState(() => state = value)),
            //     Checkbox(
            //         tristate: true,
            //         value: _triState == null ? _triState : state,
            //         activeColor: Colors.teal.withOpacity(0.3),
            //         checkColor: Colors.purpleAccent.withOpacity(0.7),
            //         onChanged: (value) => setState(() {
            //               if (value == null) {
            //                 _triState = value;
            //               } else {
            //                 _triState = '';
            //                 state = value;
            //               }
            //             }))
            //   ],
            // ),
            // Row(
            //   children: [
            //     Container(
            //       child: Text("ACECheckBox:"),
            //       width: 100,
            //     ),
            //     Column(
            //       children: [
            //         Row(
            //           children: [
            //             ACECheckbox(value: aceState, unCheckColor: Colors.amberAccent, onChanged: (value) => setState(() => aceState = value)),
            //             ACECheckbox(value: aceState, checkColor: Colors.red.withOpacity(0.7), unCheckColor: Colors.amberAccent, onChanged: (value) => setState(() => aceState = value)),
            //             ACECheckbox(value: aceState, activeColor: Colors.indigoAccent.withOpacity(0.3), checkColor: Colors.red.withOpacity(0.7), unCheckColor: Colors.amberAccent, onChanged: (value) => setState(() => aceState = value)),
            //             ACECheckbox(
            //                 tristate: true,
            //                 value: _triAceState == null ? _triAceState : aceState,
            //                 activeColor: Colors.indigoAccent.withOpacity(0.7),
            //                 checkColor: Colors.red.withOpacity(0.4),
            //                 unCheckColor: Colors.amberAccent,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     if (value == null) {
            //                       _triAceState = value;
            //                     } else {
            //                       _triAceState = '';
            //                       aceState = value;
            //                     }
            //                   });
            //                 }),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             ACECheckbox(value: aceState, unCheckColor: Colors.amberAccent, type: ACECheckBoxType.circle, onChanged: (value) => setState(() => aceState = value)),
            //             ACECheckbox(value: aceState, checkColor: Colors.red.withOpacity(0.7), unCheckColor: Colors.amberAccent, type: ACECheckBoxType.circle, onChanged: (value) => setState(() => aceState = value)),
            //             ACECheckbox(value: aceState, activeColor: Colors.indigoAccent.withOpacity(0.3), checkColor: Colors.red.withOpacity(0.7), unCheckColor: Colors.amberAccent, type: ACECheckBoxType.circle, onChanged: (value) => setState(() => aceState = value)),
            //             ACECheckbox(
            //                 tristate: true,
            //                 value: _triAceState == null ? _triAceState : aceState,
            //                 activeColor: Colors.indigoAccent.withOpacity(0.7),
            //                 checkColor: Colors.red.withOpacity(0.4),
            //                 unCheckColor: Colors.amberAccent,
            //                 type: ACECheckBoxType.circle,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     if (value == null) {
            //                       _triAceState = value;
            //                     } else {
            //                       _triAceState = '';
            //                       aceState = value;
            //                     }
            //                   });
            //                 }),
            //           ],
            //         ),
            //         Row(
            //           children: [
            //             ACECheckbox(value: aceState, width: 10.0, onChanged: (value) => setState(() => aceState = value)),
            //             ACECheckbox(value: aceState, checkColor: Colors.red.withOpacity(0.7), width: 18.0, onChanged: (value) => setState(() => aceState = value)),
            //             ACECheckbox(value: aceState, activeColor: Colors.indigoAccent.withOpacity(0.3), checkColor: Colors.red.withOpacity(0.7), width: 28.0, onChanged: (value) => setState(() => aceState = value)),
            //             ACECheckbox(
            //                 tristate: true,
            //                 value: _triAceState == null ? _triAceState : aceState,
            //                 activeColor: Colors.indigoAccent.withOpacity(0.7),
            //                 checkColor: Colors.red.withOpacity(0.4),
            //                 type: ACECheckBoxType.normal,
            //                 width: 38.0,
            //                 onChanged: (value) {
            //                   setState(() {
            //                     if (value == null) {
            //                       _triAceState = value;
            //                     } else {
            //                       _triAceState = '';
            //                       aceState = value;
            //                     }
            //                   });
            //                 }),
            //           ],
            //         ),
            //       ],
            //     )
            //   ],
            // ),
            // Row(
            //   children: [
            //     Container(
            //       child: Text("TestCheckBox:"),
            //       width: 100,
            //     ),
            //     ACECheckbox(value: aceState,   type: ACECheckBoxType.circle, onChanged: (value) => setState(() => aceState = value)),
            //   ],
            // ),
            Row(
              children: [
                CustomCheckbox(
                  borderShape: BorderShape.circle,
                  //选中后颜色和点击波纹颜色
                  activeColor:Colors.red,
                  //对勾颜色
                  // checkColor:Colors.red,
                  // focusColor:Colors.red,
                  // hoverColor:Colors.red,

                  // visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: VisualDensity.minimumDensity),
                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: myState,
                  onChanged: (value) {
                    setState(() {
                      myState = value;
                    });
                  },
                ),
                Checkbox(
                  value: myState,
                  onChanged: (value) {
                    setState(() {
                      myState = value;
                    });
                  },
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
