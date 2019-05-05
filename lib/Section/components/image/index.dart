import 'package:flutter/cupertino.dart';

class ImageDemo extends StatefulWidget {
  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Image"),
      ),
      child: SafeArea(
        child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          ImageDemoItem(BoxFit.fill),
          ImageDemoItem(BoxFit.contain),
          ImageDemoItem(BoxFit.cover),
          ImageDemoItem(BoxFit.fitWidth),
          ImageDemoItem(BoxFit.fitHeight),
          ImageDemoItem(BoxFit.scaleDown),
          ImageDemoItem(BoxFit.none),
        ],
      ),
      )
    );
  }
}

class ImageDemoItem extends StatelessWidget {
  const ImageDemoItem(this.fit);
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 321,
      color: CupertinoColors.white,
      child: Column(
        children: <Widget>[
          Container(
            child: Image.network(
              "http://images.cnitblog.com/blog/582939/201411/121511245385501.jpg",
              fit: fit,
            ),
            height: 300,
            width: 200,
          ),
          Container(
            child: Text(fit.toString()),
          ),
          Container(
            color: CupertinoColors.lightBackgroundGray,
            height: 1,
          )
        ],
      ),
    );
  }
}
