import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {

  static const List items = [600, 500, 300,100];

  ListView builder = ListView.builder(
    itemCount: items.length,

    itemBuilder: (context, i){
      return Container(
      height: 50,
      color: Colors.amber[items[i]],
      child: Center(child: Text('Entry ${i}')),
    );
    },
  );

  ListView separated = ListView.separated(
    itemCount: items.length,
    itemBuilder: (context,i){
      return Container(
      height: 50,
      color: Colors.amber[items[i]],
      child: Center(child: Text('Entry ${i}')),
    );
    },

    separatorBuilder: (context,i){
      return Container(
        color: CupertinoColors.lightBackgroundGray,
        height: 10,
        width: double.infinity,
      );
    },
  );
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("listView"),
        trailing: CupertinoButton(
          onPressed: (){
            isSelected = !isSelected;
            setState(() {
              
            });
          },
          child: Text(isSelected ? "builder" : "separated"),
        ),
      ),
      child: SafeArea(
        child: isSelected? separated : builder,
      ),
    );
  }
}