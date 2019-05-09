import 'package:flutter/cupertino.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("switch"),
      ),
      child: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 30),
          child: CupertinoSwitch(
      onChanged: (change){
        isChanged = change;
        this.setState((){

        });
      },
      value: isChanged,
      activeColor: CupertinoColors.activeBlue,
      // dragStartBehavior: ,
    ),
        ),
      ),
    );
  }
}