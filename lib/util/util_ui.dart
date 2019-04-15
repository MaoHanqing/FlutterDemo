import 'package:flutter/cupertino.dart';

class TabView extends CupertinoTabView {
  static CupertinoTabView loadTabView(String middle, Widget childer) {
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
