import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_widget/check_box/custom_check_box.dart';
import 'package:flutter_demo/structure/tb_shopping_cart/tb_shopping_cart.dart';
import 'package:flutter_demo/test/test_list_page.dart';

class StructureListPage extends StatefulWidget {
  StructureListPage({Key key}) : super(key: key);

  @override
  _StructureListPageState createState() => _StructureListPageState();
}

class _StructureListPageState extends State<StructureListPage> {
  ///淘宝购物车展示结构使用变量
  List<bool> checked = [false, false, false, false, false];
  int tbShoppingCartNum = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("组件设计封装"),
      ),
      body: ListView(
        children: [
          ///淘宝购物车展示结构
          for (var tbShoppingNum = 0 ; tbShoppingNum < tbShoppingCartNum; tbShoppingNum++)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: CustomCheckbox(
                        borderShape: BorderShape.circle,
                        activeColor: Colors.red,
                        value: checked.every((element) => element),
                        onChanged: (value) {
                          setState(() {
                            if (value) {
                              List.generate(checked.length, (index) {
                                checked[index] = true;
                              });
                            } else if (!value) {
                              List.generate(checked.length, (index) {
                                checked[index] = false;
                              });
                            }
                          });
                        },
                      ),
                      title: Text("租賃"),
                      contentPadding: EdgeInsets.zero,
                      trailing: TextButton(
                        child: Text("去领优惠"),
                        onPressed: () {
                          print("领优惠");
                        },
                      ),
                    ),
                    for (var i = 0; i < 5; i += 1)
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CustomCheckbox(
                                  borderShape: BorderShape.circle,
                                  activeColor: Colors.red,
                                  value: checked[i],
                                  onChanged: (value) {
                                    setState(() {
                                      checked[i] = value;
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
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Column(
                                children: List.generate(
                                  7,
                                  (index) => Text("北极星 $index"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
