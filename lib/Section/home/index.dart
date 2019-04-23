// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../listView/index.dart'show ShowList;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        GestureDetector(child: Text("ListView"),
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(
              maintainState: true,
              title: "ListView",
              builder: (_){
                return ShowList();
              }
            ));
            print("ddd");
          },
        )
      ],
    ));
  }
}
