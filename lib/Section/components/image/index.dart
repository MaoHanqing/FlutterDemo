import 'package:flutter/cupertino.dart';
class ImageDemo extends StatefulWidget {
  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}

class ImageDemoItem extends StatelessWidget {
  const ImageDemoItem(this.fit);
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network("",fit: fit,),
        Text(fit.toString())
      ],
    );
  }
}