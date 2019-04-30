import 'package:flutter/cupertino.dart';
import './navigator/index.dart';
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
            Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(
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

class ComponentItemt extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}