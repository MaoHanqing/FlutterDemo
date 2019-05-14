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
          _MeHeaderView(),
          _MidView(),
          _ListView(),
        ],
      ),
    );
  }
}

class _MeHeaderView extends StatefulWidget {
  @override
  __MeHeaderViewState createState() => __MeHeaderViewState();
}

class __MeHeaderViewState extends State<_MeHeaderView> {
  @override
  Widget build(BuildContext context) {
    double stateHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: 125 + stateHeight,
      color: CupertinoColors.activeOrange,
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
            left: 0,
            top: 10,
            child: Container(
              child: CupertinoButton(
                minSize: 24,
                // color: CupertinoColors.darkBackgroundGray,
                child: Image.asset(
                  "images/icon/ic_saoyisao@3x.png",
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  print("扫一扫");
                },
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 10,
            child: Row(
              children: <Widget>[
                CupertinoButton(
                  minSize: 24,
                  // color: CupertinoColors.destructiveRed,
                  // padding: EdgeInsets.only(right: 24),
                  child: Image.asset(
                    "images/icon/ic_setting_w_new@3x.png",
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    print("设置");
                  },
                ),
                CupertinoButton(
                  minSize: 24,
                  // color: CupertinoColors.darkBackgroundGray,
                  child: Image.asset(
                    "images/icon/ic_message_new@3x.png",
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    print("消息");
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                print("Header did Tap");
              },
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                      ],
                    ),
                    Image.asset(
                      "images/icon/ic_arrows_list_me@3x.png",
                      height: 12,
                      width: 7,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MidView extends StatefulWidget {
  @override
  __MidViewState createState() => __MidViewState();
}

class __MidViewState extends State<_MidView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: CupertinoButton(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "images/icon/ic_rankinglist_new@3x.png",
                      width: 24,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Text(
                        "排行榜",
                        style: TextStyle(
                            color: Color(0x000000).withOpacity(0.45),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  print("排行榜");
                },
              ),
            ),
          ),
          Container(
            color: Color(0x000000).withOpacity(0.1),
            width: 0.5,
            height: 25,
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: CupertinoButton(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "images/icon/ic_jinbei_new@3x.png",
                      width: 24,
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Text(
                        "1000",
                        style: TextStyle(
                            color: Color(0x000000).withOpacity(0.45),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  print("金贝");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _ListViewItem {
 _ListViewItem(this.image,this.title,{this.trail});
  String image;
  String title;
  String trail;
}



class _ListView extends StatelessWidget {
  List<List<_ListViewItem>> items = [
    [_ListViewItem("images/icon/ic_list_badge@3x.png", "我的勋章"), 
    _ListViewItem("images/icon/ic_list_ability@3x.png", "我的能力"), 
    _ListViewItem("images/icon/ic_list_peiyin@3x.png", "配音作品"),
    _ListViewItem("images/icon/ic_list_cuoti@3x.png", "错题库") 
    ],
    [_ListViewItem("images/icon/ic_list_class@3x.png", "我的班级"),
     _ListViewItem("images/icon/ic_list_membership@3x.png", "我的套餐")],
    [_ListViewItem("images/icon/ic_list_yijian@3x.png", "帮助与反馈")]
  ];

  List<Widget> listViews() {
    List<Widget> listviews = [];
    for (var sectionItems in items) {
      listviews.add(ListView.separated(
        padding: EdgeInsets.only(top: 10),
        itemBuilder: (context, i) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Image.asset(
                        sectionItems[i].image,
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        sectionItems[i].title,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0x000000).withOpacity(0.65)),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(sectionItems[i].trail),
                      Image.asset("images/icon/ic_arrows_grey@3x.png",width: 5,height: 10,)
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: sectionItems.length,
        separatorBuilder: (context, i) {
          return Container(
            height: 1,
            padding: EdgeInsets.only(left: 16),
            width: double.infinity,
          );
        },
      ));
    }
    return listviews;
  }

  @override
  Widget build(BuildContext context) {
    return  this.listViews().first;
  }
}
