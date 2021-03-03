import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_widget/check_box/custom_check_box.dart';

class TbShoppingCart extends StatefulWidget {
  TbShoppingCart({Key key}) : super(key: key);

  @override
  _TbShoppingCartState createState() {
    return _TbShoppingCartState();
  }
}

class _TbShoppingCartState extends State<TbShoppingCart> {
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
    bool myState = true;

    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(  vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckbox(
              borderShape: BorderShape.circle,
              activeColor: Colors.red,
              value: myState,
              onChanged: (value) {
                setState(() {
                  myState = value;
                });
              },
            ),
            Container(
              child: Image.asset(
                "assets/images/avatar.png",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: List.generate(
                  3,
                      (index) => Text("北极星 $index"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
