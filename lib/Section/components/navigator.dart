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
      child: Row(
        children: <Widget>[
          CupertinoButton(
            child: Text("pop"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          CupertinoButton(
            child: Text("popToRoot"),
            onPressed: (){
              Navigator.of(context).popUntil((route){
                return route.settings.name == "/";
              });
            },
          )
        ],
      ),

    );
  }
}