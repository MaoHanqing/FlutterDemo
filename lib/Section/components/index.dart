import 'package:flutter/cupertino.dart';
import './navigator/index.dart';
import './image/index.dart';
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
        ),
         GestureDetector(
          child: Text("Image"),
          onTap: () {
            Navigator.of(context,rootNavigator: true).push(CupertinoPageRoute(
              builder: (BuildContext context){
                return ImageDemo();
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