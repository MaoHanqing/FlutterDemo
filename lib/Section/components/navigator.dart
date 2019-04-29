import 'package:flutter/cupertino.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Page2"),
      ),
      child: SafeArea(
          child: Container(
            alignment: Alignment.center,
            color: CupertinoColors.activeGreen,
            child: Column(
              children: <Widget>[
                CupertinoButton(
                  color: CupertinoColors.activeBlue,
                  child: Text(
                    "pop",
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoButton(
                  disabledColor: CupertinoColors.activeGreen,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  color: CupertinoColors.activeBlue,
                  child: Text(
                    "popToRoot",
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) {
                      return route.settings.name == "/";
                    });
                  },
                ),
                CupertinoButton(
                  disabledColor: CupertinoColors.activeGreen,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  color: CupertinoColors.activeBlue,
                  child: Text(
                    "turn to Home",
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                  onPressed: () {
                  
                  },
                )
              ],
            ),
          ),
        ), 
    );
  }
}
