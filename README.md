##  Flutter 简介
现在开始玩Flutter的好处呢, 我认为有如下几点:
1. 如果我们以后想在Google的新系统上跑程序的话, 用Flutter来编写是一定没错的.

2. Flutter用Dart, 学习Flutter的同时会使我们掌握一门新的语言. 买一送一.


3. Flutter天生支持iOS风格的控件, 称为Cupertino, 这样我们可以一套设计, 一套code跑在两个系统上.


4. 学习Flutter的过程会改变手机端app开发的思维. 毕竟这个亲只有一个activity. 全程跟个游戏引擎一样. 60帧每秒绘图.

5. Hot reload. 极大地加速了我们的开发效率. 试过了, 绝对会爱上它.

6. Flutter提供method channel给Android和iOS. 其实我们可以只用Flutter来开发UI. 其他底层逻辑可以封装Android和iOS分别的lib package. 然后直接Rx封装写回method channel. 也是一种新的开发模式.性能更好, 兼容性更好, 开发起来更有乐趣.

## 常用Widget
### Flutter路由
Flutter路由分为<font color=#0099ff>静态路由</font>和<font color=#0099ff>动态路由</font>两种

### ListView

  ListView是非常常用的滚动Widget。用来在不同的滚动方向上展示子控件。itemExtent（double类型）会强制子控件（cell）为制定尺寸。明确的itemExtent比子控件自适应尺寸在展示上更有效率。

  ListView有四种构造方式：
  1. ListView():
  默认的构造方式,适合少量子控件（cell）的列表，会构建所有可能展示的子控件。

          ListView(
            children: <Widget>[  
            ],
          )

  2. ListView.builder():
  带有一个IndexedWidgetBuilder,适用于有大量子控件（cell）的列表，只会构建实际可见的子控件。

          ListView.builder(
            itemCount: 10,
            itemBuilder: (context,i){
              return  Container(
                color: Colors.red,
                width: 200,
                height: 50,
                );
            },
          )


  3. ListView.separated():
  带两个IndexedWidgetBuilder,适合固定数量的子控件（cell）列表，会在各个子控件中间构建separator控件。
          ListView.separated(
            itemCount: 10,
            itemBuilder: (context,i){
              return  Container(
                color: Colors.red,
                width: 200,
                height: 50,
              );
            },
            separatorBuilder: (context,i){
              return Container(
                color: Colors.blue,
                height: 20,
                width: 100,
              );
            },
          )    

丑图示例：

![](/README/images/listview_separetor.png)

4. ListView.custom():
通过SliverChildDelegate，可以任意自定义子控件。
        ListView.custom(
         childrenDelegate: SliverChildBuilderDelegate(
           (context, index) {
             return Container();
           },
           childCount: 10,
         ),

ListView中的子控件（cell）点击事件是在子空间外包用GestureDetector一层，通过其onTap方法即可实现。
