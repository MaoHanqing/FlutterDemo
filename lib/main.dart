import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './Section/Home/index.dart' show Home;
import './Section/study/index.dart' show Study;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Image> images = [
    Image.asset('images/icon_player_lyc_tu.png', width: 24.0, height: 24.0),
    Image.asset('images/icon_player_lyc_wen.png', width: 24.0, height: 24.0)
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: images[0], title: Text("首页")),
          BottomNavigationBarItem(icon: images[1], title: Text("个人"))
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        if (index == 0) {
         return loadTabView("1", Home());
        } else {
         return loadTabView("2", Study());
        }
      },
    ));
  }

  CupertinoTabView loadTabView(String middle, Widget childer) {
    return CupertinoTabView(builder: (BuildContext context) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(middle),
        ),
        child: childer,
      );
    });
  }
}
