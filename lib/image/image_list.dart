import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/image/animated_image_route.dart';
import 'package:flutter_demo/image/image_view.dart';
import 'package:image_picker/image_picker.dart';

class ImageList extends StatefulWidget {
  ImageList({Key key}) : super(key: key);

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  final picker = ImagePicker();
  List<File> imageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("图片展示"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500.0,
          childAspectRatio: 2.5,
        ),
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onDoubleTap: () {
              // 使用Hero路由
              // Navigator.push(
              //   context,
              //   PageRouteBuilder(
              //     pageBuilder: (BuildContext context, Animation animation,
              //         Animation secondaryAnimation) {
              //       return FadeTransition(
              //         opacity: animation,
              //         child: ImageView(
              //           file: imageList[index],
              //           title: "图片预览",
              //         ),
              //       );
              //     },
              //   ),
              // );
              // 使用自定義動畫
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AnimatedImageRoute(file: imageList[index]),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient:
                      RadialGradient(colors: [Colors.white, Colors.white]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Container(
                    child: Image.file(imageList[index]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        imageList.add(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }
}
