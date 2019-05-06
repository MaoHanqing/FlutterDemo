import 'package:flutter/cupertino.dart';

class ImageDemo extends StatefulWidget {
  @override
  _ImageDemoState createState() => _ImageDemoState();
}

class _ImageDemoState extends State<ImageDemo> {
  List items = [BoxFit.fill, BoxFit.contain, BoxFit.cover, BoxFit.fitWidth, 
  BoxFit.fitHeight,BoxFit.none, BlendMode.overlay,BlendMode.clear,
  BlendMode.color,BlendMode.darken,BlendMode.colorBurn,BlendMode.colorDodge,
  BlendMode.difference,BlendMode.dst,BlendMode.dstATop,BlendMode.dstIn,BlendMode.dstOut,BlendMode.dstOver,BlendMode.exclusion,BlendMode.hardLight,
  BlendMode.hue,BlendMode.lighten,BlendMode.luminosity,BlendMode.modulate,BlendMode.multiply,BlendMode.overlay,BlendMode.plus,BlendMode.saturation,
  BlendMode.screen,BlendMode.softLight,BlendMode.src,BlendMode.srcATop,BlendMode.srcIn,BlendMode.srcOut,BlendMode.srcOver,BlendMode.xor,
  ImageRepeat.noRepeat,ImageRepeat.repeat,ImageRepeat.repeatX,ImageRepeat.repeatY];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Image"),
        ),
        child: SafeArea(
          child: ListView.builder(
            itemBuilder: (context,i){
              var item = items[i];
              if (item.runtimeType == BlendMode){
                return ImageDemoItem.bendMode(item);
              }else if (item.runtimeType == ImageRepeat){
                return ImageDemoItem.repeat(item);
              } else{
                return ImageDemoItem.fit(item);
              }
              
              
            },
            itemCount: items.length,
          )
        ));
  }
}

class ImageDemoItem extends StatelessWidget {
  ImageDemoItem.fit(this._fit);
  ImageDemoItem.bendMode(this._bendMode);
  ImageDemoItem.repeat(this._repeat);
  ImageRepeat _repeat = ImageRepeat.noRepeat;
  BoxFit _fit ;
  BlendMode _bendMode;
  @override
  Widget build(BuildContext context) {
    String text = _bendMode != null ? _bendMode.toString() : _fit != null ? _fit.toString() : _repeat.toString();
    Color color = _bendMode == null ? null : CupertinoColors.destructiveRed;
    return Container(
      padding: EdgeInsets.only(left: 16, right: 0),
      child: Column(
        children: <Widget>[
          Container(
            color: CupertinoColors.white,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                Container(
                  color: CupertinoColors.activeBlue,
                  child: Image.network(
                      "http://images.cnitblog.com/blog/582939/201411/121511245385501.jpg",
                      fit: _fit,
                      color: color,
                      colorBlendMode: this._bendMode,
                      repeat: _repeat,
                      ),
                  height: 160,
                  width: 160,
                ),
                Expanded(
                  child: Container(
                  color: CupertinoColors.destructiveRed,
                  child: Text(text, textAlign: TextAlign.right),
                  padding: EdgeInsets.only(right: 10),
                ),
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
    );
  }
}
