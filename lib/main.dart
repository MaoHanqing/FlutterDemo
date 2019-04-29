import 'package:flutter/cupertino.dart';
import './Section/components/index.dart';
import './Section/study/index.dart' show Study;
import './Section//me/index.dart' show Me;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Image loadIcon(String imageName) {
    return Image.asset(imageName, height: 36.0, width: 36.0);
  }

  List<Image> images() {
    return [
      loadIcon('images/tabBar_icon/Bars-Icons-course-Inactive@3x.png'),
      loadIcon('images/tabBar_icon/Bars-Icons-course-Light@3x.png'),
      loadIcon('images/tabBar_icon/Bars-Icons-selfstudy-Inactive@3x.png'),
      loadIcon('images/tabBar_icon/Bars-Icons-selfstudy-Light@3x.png'),
      loadIcon('images/tabBar_icon/Bars-Icons-me-Inactive@3x.png'),
      loadIcon('images/tabBar_icon/Bars-Icons-me-Light@3x.png')
    ];
  }

  @override
  Widget build(BuildContext context) {
    var images = this.images();

    return CupertinoApp(
        home: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: images[0], title: Text("课程"), activeIcon: images[1]),
              BottomNavigationBarItem(
                  icon: images[2], title: Text("自学"), activeIcon: images[3]),
              BottomNavigationBarItem(
                  icon: images[4], title: Text("个人"), activeIcon: images[5])
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                if (index == 0) {
                  return _loadPage(ComponentList(), "Components");
                } else if (index == 1) {
                  return _loadPage(Study(), "2");
                } else {
                  return _loadPage(Me(), "3");
                }
              },
            );
          },
        ));
  }

  Widget _loadPage(Widget child, String title) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: child,
    );
  }
}
