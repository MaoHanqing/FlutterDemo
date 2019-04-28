import 'package:flutter/cupertino.dart';
import './navigator.dart';
class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("NavigationPage"),
        trailing: CupertinoButton(
          child: Text("Push"),
          onPressed: (){
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context){
                return Navigation();
              }
            ));
          },
        ),
      ),
      child: Row(
        children: <Widget>[
          CupertinoButton(
            child: Text("PushToNextPage"),
            onPressed: (){
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context){
                  return CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: Text("page2"),
                    ),
                    child: SafeArea(
                      child: Center(
                      child: CupertinoButton(
                        child: Text("Pop"),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    )
                  );
                }
              ));
            },
          ),
        ],
      ),
    );
  }
}