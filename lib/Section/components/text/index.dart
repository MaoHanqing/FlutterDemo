import 'package:flutter/cupertino.dart';

class TextDemo extends StatefulWidget {
  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  List items = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      backgroundColor: CupertinoColors.activeBlue,
      child: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return TextItem();
          },
        ),
      ),
    );
  }
}

class TextItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        height: 100,
        color: CupertinoColors.destructiveRed,
        child: Column(
          children: <Widget>[

            Expanded(
              child: Container(
                color: CupertinoColors.activeBlue,
                child: Text(
                "hello world",
                style: TextStyle(
                  // color: CupertinoColors.destructiveRed,
                ),
              ),
              )
            ),
          ],
        ));
  }
}
