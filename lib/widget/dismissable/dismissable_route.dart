import 'package:flutter/material.dart';

class DismissableRoute1 extends StatefulWidget {
  DismissableRoute1({Key key}) : super(key: key);

  @override
  _DismissableRoute1State createState() => _DismissableRoute1State();
}

class _DismissableRoute1State extends State<DismissableRoute1> {
  List<String> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滑动删除1"),
      ),
      body: new ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];

          return new Dismissible(
            direction: DismissDirection.endToStart,
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify Widgets.
            key: new Key(item),
            // We also need to provide a function that will tell our app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              print(direction);
              // _items.removeAt(index);

              // Scaffold.of(context).showSnackBar(
              //     new SnackBar(content: new Text("$item 删除")));
            },
            // Show a red background as the item is swiped away
            background: Container(
              width: 120,
                color: Colors.red,
                child: Center(
                  child: Text("删除",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
            ),
            child: new ListTile(title: new Text('$item')),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _items = new List<String>.generate(20, (i) => "Item ${i + 1}");
  }
}
