import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  static const EventChannel eventChannel_init =
      const EventChannel('com.alo7Student/init');
  static const MethodChannel methodChannel_actions =
      const MethodChannel('com.alo7Student/me/actions');

  String goldNum = "0";
  String name;
  String avatar;
  String medal;
  String ablility;
  String error;

  @override
  void initState() {
    super.initState();
    print("flutter_init");
    eventChannel_init
        .receiveBroadcastStream()
        .listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    final Map<String, dynamic> map = event;
    print(map);
    setState(() {
        this.goldNum = map["gold"];
        this.name = map["name"];
      // this.goldNum = event.
    });
  }

  // 错误返回
  void _onError(Object error) {}

  //方法回掉
  _listItemDidSelected(int index) async {
    await methodChannel_actions.invokeMethod("listDidSelected", index);
  }

  _actionsDidTap(String identifier) async {
    await methodChannel_actions.invokeMethod(identifier);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home:  Container(
        child: Column(
          children: <Widget>[
            _MeHeaderView((id) {
              _actionsDidTap(id);
            }),
            _MidView(goldNum, (id) {
              _actionsDidTap(id);
            }),
            _ListView(
              tapCallBack: (i) {
                _listItemDidSelected(i);
              },
            ),
          ],
        ),
    ),
    );
  }
}

typedef ActionCallBack = void Function(String identifier);

class _MeHeaderView extends StatelessWidget {
  _MeHeaderView(this.didTap);
  final ActionCallBack didTap;
  @override
  Widget build(BuildContext context) {
    double stateHeight = 20;
    print(stateHeight);
    return Container(
      height: 125 + stateHeight,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              "images/icon/bg_blue@3x.png",
              fit: BoxFit.fill,
            ),
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
                  didTap("scan");
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
                    didTap("setting");  
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
                    didTap("message");
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
                didTap("person");
              },
              child: Container(
                color: CupertinoColors.white.withOpacity(0),
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

class _MidView extends StatelessWidget {
  _MidView(this.goldNum, this.didTap);
  final String goldNum;
  final ActionCallBack didTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:  CupertinoColors.white,
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
                  didTap("rank");
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
                        this.goldNum,
                        style: TextStyle(
                            color: Color(0x000000).withOpacity(0.45),
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  didTap("gold");
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
  _ListViewItem(this.image, this.title, {this.trail = ""});
  String image;
  String title;
  String trail = "";
}

typedef ItemDidSelectedCallback = void Function(int i);

class _ListView extends StatelessWidget {
  final List items = [
    _ListViewItem("images/icon/ic_list_badge@3x.png", "我的勋章"),
    _ListViewItem("images/icon/ic_list_ability@3x.png", "我的能力"),
    _ListViewItem("images/icon/ic_list_peiyin@3x.png", "配音作品"),
    _ListViewItem("images/icon/ic_list_cuoti@3x.png", "错题库"),
    null,
    _ListViewItem("images/icon/ic_list_class@3x.png", "我的班级"),
    _ListViewItem("images/icon/ic_list_membership@3x.png", "我的套餐"),
    null,
    _ListViewItem("images/icon/ic_list_yijian@3x.png", "帮助与反馈")
  ];

  final ItemDidSelectedCallback tapCallBack;

  _ListView({Key key, this.tapCallBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0x000000).withOpacity(0.05),
        child: ListView.separated(
          padding: EdgeInsets.only(top: 10),
          itemBuilder: (context, i) {
            var item = items[i];
            if (item == null) {
              return Padding(padding: EdgeInsets.only(top: 10));
            }
            return GestureDetector(
              child: Container(
                color: CupertinoColors.white,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            items[i].image,
                            width: 24,
                            height: 24,
                          ),
                          Text(
                            items[i].title,
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
                          Text(items[i].trail ?? ""),
                          Image.asset(
                            "images/icon/ic_arrows_grey@3x.png",
                            width: 5,
                            height: 10,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                this.tapCallBack(i);
              },
            );
          },
          itemCount: items.length,
          separatorBuilder: (context, i) {
            var item = items[i];
            if (item == null || items[i + 1] == null) {
              return Container();
            }
            return Container(
              height: 1,
              alignment: Alignment.centerLeft,
              child: Container(
                width: 16,
                color: CupertinoColors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
