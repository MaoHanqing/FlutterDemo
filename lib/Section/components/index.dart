import 'package:flutter/cupertino.dart';
import './navigator_page.dart';
class ComponentList extends StatefulWidget {
  @override
  _ComponentListState createState() => _ComponentListState();
}

class _ComponentListState extends State<ComponentList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        GestureDetector(
          child: Text("Navigation"),
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (BuildContext context){
                return NavigationPage();
              },
            ));
          },
        )
      ],
    ));
  }
}
