import 'package:flutter/cupertino.dart';

class TextDemo extends StatefulWidget {
  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  //  Paint pg = Paint();
  //创建text样式，边框，对齐方式，等

  List<Text> items = [Text("简单的测试"),
  Text("测试多行",textAlign: TextAlign.right,style: TextStyle(
    background: Paint()
  ),),];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      // backgroundColor: CupertinoColors.activeBlue,
      child: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return TextItem(items[i]);
          },
        ),
      ),
    );
  }
}

class TextItem extends StatelessWidget {
  const TextItem(this.text);
  final Text text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      color: CupertinoColors.destructiveRed,
      child: this.text
    );
  }
}
