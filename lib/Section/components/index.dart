import 'package:flutter/cupertino.dart';
import './navigator/index.dart';
import './image/index.dart';
import './text/index.dart';

class ComponentList extends StatefulWidget {
  @override
  _ComponentListState createState() => _ComponentListState();
}

class _ComponentListState extends State<ComponentList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 600,
        padding: EdgeInsets.all(10),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
      spacing: 8,
      runSpacing: 20,
      children: <Widget>[
        ComponentItemt(
        "Navigation",
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(
              builder: (BuildContext context) {
                return NavigationPage();
              },
            ));
          },
        ),
         ComponentItemt(
          "Image",
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(
              builder: (BuildContext context) {
                return ImageDemo();
              },
            ));
          },
        ),
        ComponentItemt(
          "Text",
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(CupertinoPageRoute(
              builder: (BuildContext context) {
                return TextDemo();
              },
            ));
          },
        )
      ],
    )),
    );
  }
}

class ComponentItemt extends StatelessWidget {
  ComponentItemt(this.title, {this.onTap});
  final void Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: CupertinoColors.activeBlue,
      child: GestureDetector(
        child: Text(title),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
