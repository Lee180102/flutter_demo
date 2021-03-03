import 'package:flutter/material.dart';

class LazyLoadingWidget extends StatefulWidget {
  LazyLoadingWidget({Key key}) : super(key: key);

  @override
  _LazyLoadingWidgetState createState() {
    return _LazyLoadingWidgetState();
  }
}

class _LazyLoadingWidgetState extends State<LazyLoadingWidget> {
  ScrollController _scrollController = new ScrollController();
  List _list = new List();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

  _loadMore() {

  }

  _doRefresh() {

  }

  _toTop() {
    _scrollController.animateTo(.0, duration: Duration(milliseconds: 200), curve: Curves.ease);
  }
}
