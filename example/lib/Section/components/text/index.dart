import 'package:flutter/cupertino.dart';

class TextDemo extends StatefulWidget {
  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  //  Paint pg = Paint();
  //创建text样式，边框，对齐方式，等

  List<Text> items = [
    Text("简单的测试"),
    Text(
      "测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行测试多行",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    ),
    Text("Text Style 测试",
    style: TextStyle(
      color: CupertinoColors.activeGreen,
      fontSize: 25,
      fontFamily: "ZCOOLKuaiLe",
      // letterSpacing: 5,
      // wordSpacing: 20,
      // fontWeight: FontWeight.bold,
    ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: SafeArea(
        child: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return TextItem(items[i]);
          },
          separatorBuilder: (context,i){
            return Container(
              color: CupertinoColors.activeBlue,
              height: 1,
              width: double.infinity,
            );
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
        height: 100,
        child: this.text,
      );
  }
}
