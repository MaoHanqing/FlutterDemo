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
        ));
  }
}

class ImageDemoItem extends StatelessWidget {
  const ImageDemoItem(this.fit);
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 16, right: 0),
          child: Column(
            children: <Widget>[
              Container(
                height: 81,
                color: CupertinoColors.white,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      color: CupertinoColors.activeBlue,
                      child: Image.network(
                          "http://images.cnitblog.com/blog/582939/201411/121511245385501.jpg",
                          fit: fit),
                      height: 80,
                      width: 160,
                    ),
                    Container(
                      color: CupertinoColors.destructiveRed,
                      child: Text(fit.toString(), textAlign: TextAlign.right),
                      padding: EdgeInsets.only(left: 10),
                    )
                  ],
                ),
              ),
              Container(
                color: CupertinoColors.lightBackgroundGray,
                height: 1,
              )
            ],
          ),
        )
      ],
    );
  }
}
