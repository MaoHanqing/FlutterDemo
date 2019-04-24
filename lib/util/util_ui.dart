import 'package:flutter/cupertino.dart';

class TabView extends CupertinoTabView {
  static CupertinoPageScaffold loadPageScffloldWithTitle(Widget child,{String navBarTitle}){
    CupertinoNavigationBar navbar;
    if (navBarTitle != null){
      navbar = CupertinoNavigationBar(
        middle: Text(navBarTitle),
      );
    }
    return loadPageScfflold(child,navigationBar: navbar);
  }

  static CupertinoPageScaffold loadPageScfflold(Widget child,{CupertinoNavigationBar navigationBar}){
    return CupertinoPageScaffold(
      navigationBar: navigationBar,
      child: child,
    );
  }

  static CupertinoTabView loadTabView(String middle, Widget childer) {
    return CupertinoTabView(builder: (BuildContext context) {
      return loadPageScffloldWithTitle(childer,navBarTitle: middle);
    });
  }
}
