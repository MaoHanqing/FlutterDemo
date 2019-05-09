import 'package:flutter/cupertino.dart';
import './navigator/index.dart';
import './image/index.dart';
import './text/index.dart';
import './gridView/index.dart';
import 'listview/index.dart';
class ComponentList extends StatefulWidget {
  @override
  _ComponentListState createState() => _ComponentListState();
}

class _ComponentListState extends State<ComponentList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            spacing: 8,
            runSpacing: 20,
            children: <Widget>[
              ComponentItemt(
                "Navigation",
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return NavigationPage();
                    },
                  ));
                },
              ),
              ComponentItemt(
                "Image",
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return ImageDemo();
                    },
                  ));
                },
              ),
              ComponentItemt(
                "Text",
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return TextDemo();
                    },
                  ));
                },
              ),
               ComponentItemt(
                "GridView",
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return GridViewDemo();
                    },
                  ));
                },
              ),
              ComponentItemt(
                "ListView",
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return ListViewDemo();
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
    return GestureDetector(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.activeOrange, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(title),
            ),
            Icon(
              CupertinoIcons.video_camera_solid,
              size: 30,
              color: CupertinoColors.destructiveRed,
            )
          ],
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
