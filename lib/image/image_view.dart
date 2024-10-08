import 'dart:io';

import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  ImageView({Key key, this.title, this.file}) : super(key: key);
  String title;
  File file;

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Center(
            child: Hero(
              tag: "image",
              child: Image.file(widget.file),
            ),
          ),
        ],
      ),
    );
  }
}
