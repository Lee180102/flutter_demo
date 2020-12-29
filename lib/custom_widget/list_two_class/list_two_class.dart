import 'package:flutter/material.dart';

/// 两级
class ListTwoClass extends StatefulWidget {
  @override
  _ListTwoClassState createState() => _ListTwoClassState();
}

class _ListTwoClassState extends State<ListTwoClass> {
  var _words = <Item>[];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        return _buildItem(index);
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _onTap(int index) {
    print(index);
    setState(() {
      Item item = _words[index];
      item.isOpen = !item.isOpen;
    });
  }

  Widget _buildItem(int index) {
   int _index =index;
    if (_words[index].isOpen) {
      Item item = _words[index];
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            trailing: Icon(Icons.expand_less),
            title: Text(item.value.toString()),
            onTap: () => _onTap(_index),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                // color: Colors.blue,
                child: ListTile(
                  title: Text(_words[index].value.toString()),
                  onTap: () => _onTap(_index),
                ),
              );
            },
            // separatorBuilder: (context, index) => Divider(height: .0),
            itemCount: item.subSize,
          ),
        ],
      );
    } else {
      return ListTile(
        trailing: Icon(Icons.expand_more),
        title: Text(_words[index].value.toString()),
        onTap: () => _onTap(index),
      );
    }
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 1)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length,
          [
            Item(1, 3, false),
            Item(2, 2, true),
            Item(3, 3, false),
          ],
        );
      });
    });
  }
}

class Item {
  int value;
  int subSize;
  bool isOpen;

  Item(this.value, this.subSize, this.isOpen);
}

class SubItem {
  int value;

  SubItem(this.value);
}
