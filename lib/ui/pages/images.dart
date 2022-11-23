import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyImage());
}

class MyImage extends StatelessWidget {
  const MyImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Latihan Image"),
            ),
            body: Column(
              children: <Widget>[
                Text('Image Cache'),
                Center(
                  child: Container(
                      width: 200,
                      height: 200,
                      padding: EdgeInsets.all(3),
                      child: Image(
                        image: CachedNetworkImageProvider(
                            "https://static.dw.com/image/61514146_605.jpg"),
                      )),
                )
              ],
            )));
  }
}
