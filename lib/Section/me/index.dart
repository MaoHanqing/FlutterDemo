import 'package:flutter/cupertino.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "images/icon/bg_blue@3x.png",
                ),
                Positioned.fill(
                  child: Image.asset(
                    "images/icon/bg_planet_me@3x.png",
                    alignment: Alignment.centerRight,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: (){
                      print("tap");
                    },
                    child: Container(
                    padding: EdgeInsets.all(16),
                    color: CupertinoColors.destructiveRed,
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                                "images/avatar/avatar_bo_40@3x.png"),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "艾米丽",
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                "查看或编辑个人主页",
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          "images/icon/ic_arrows_list_me@3x.png",
                          height: 12,
                          width: 7,
                        )
                      ],
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
