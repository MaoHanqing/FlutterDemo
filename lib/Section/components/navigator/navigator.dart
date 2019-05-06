import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
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
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Padding(
                //   padding: EdgeInsets.only(top: 20),
                // ),
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                CupertinoButton(
                  disabledColor: CupertinoColors.activeGreen,
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
                // Padding(
                //   padding: EdgeInsets.only(top: 20),
                // ),
                // CupertinoButton(
                //   disabledColor: CupertinoColors.activeGreen,
                //   // padding: EdgeInsets.only(left: 10, right: 10),
                //   color: CupertinoColors.activeBlue,
                //   child: Text(
                //     "turn to Home",
                //     style: TextStyle(color: CupertinoColors.white),
                //   ),
                //   onPressed: () {
                //     Navigator.of(context,rootNavigator: true).pop();
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
