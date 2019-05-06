##  Flutter 简介
现在开始玩Flutter的好处呢, 我认为有如下几点:
1. 如果我们以后想在Google的新系统上跑程序的话, 用Flutter来编写是一定没错的.

2. Flutter用Dart, 学习Flutter的同时会使我们掌握一门新的语言. 买一送一.


3. Flutter天生支持iOS风格的控件, 称为Cupertino, 这样我们可以一套设计, 一套code跑在两个系统上.


4. 学习Flutter的过程会改变手机端app开发的思维. 毕竟这个亲只有一个activity. 全程跟个游戏引擎一样. 60帧每秒绘图.

5. Hot reload. 极大地加速了我们的开发效率. 试过了, 绝对会爱上它.

6. Flutter提供method channel给Android和iOS. 其实我们可以只用Flutter来开发UI. 其他底层逻辑可以封装Android和iOS分别的lib package. 然后直接Rx封装写回method channel. 也是一种新的开发模式.性能更好, 兼容性更好, 开发起来更有乐趣.

## 常用Widget
Cupertino和Material是Flutter提供的两种UI风格，前者为iOS风格。

### Navigator&Route

Flutter跳转是通过navigator跳转route。Route是承载全屏视图的widget，类似为iOS中的viewController。APP经常会创建大量的Route，可以通过Route的命名来寻找，通常Route的命名格式为"/a,/b"。
Navigator记录并管理一系列Route的入栈出栈。尽管可以直接创建navigator，但是一般而言，我们常使用MaterialApp、CupertinoApp和widgetsApp自身带有的navigator。常用CupertinoPageRoute和MaterialPageRoute作为页面间跳转的Route。
另外还有PopUpRoutes则是直接弹出，类似iOS中的present方式。我们也可以通过自定义PageRoute来进行一系列订制的内容，比如跳转动画。
另外在app中经常会用到Tabbed navigation（由tab持有的navigator），这同一层级的navigator则由App的RootNavigator来管理。

#### 跳转到系统应用
在iOS里，你使用特点的URL scheme来跳转到其他应用。对于系统级的App，这个scheme依赖于App。为了在Flutter里实现这个功能，创建Native的集成插件，或者使用已有的插件，比如url_launcher。

      Scheme  
      http:<URL> , https:<URL>, e.g. http://flutter.io
      tel:<phone number>, e.g. tel:+1 555 010 999
      sms:<phone number>, e.g. sms:5550101234
      mailto:<email address>?subject=<subject>&body=<body>, e.g. mailto:smith@example.org?subject=News&body=New%20plugin

退出app可以调用下面的方法（iOS不可用）

    //On iOS, calls to this method are ignored because Apple's human interface
    // guidelines state that applications should not exit themselves.
    SystemNavigator.pop();

### CupertinoTabView

可以持有多个同一层级的Navigator，分别管理各自的Route堆栈。类似iOS中的UITabBarController。


### Image&Icon
Flutter中用Image来加载显示图片，数据源可以是本地的Asset，data，Url和手机内存。

    Image.asset(name);//工程地址
    Image.network(src);//网络图片地址
    Image.file(file);//手机内存文件
    Image.memory(bytes);//data
Image定义了一系列的参数，可以通过这些参数改变外观，大小，混合。

    const Image({
      ...
      this.width, //图片的宽
      this.height, //图片高度
      this.color, //图片的混合色值
      this.colorBlendMode, //混合模式
      this.fit,//缩放模式
      this.alignment = Alignment.center, //对齐方式
      this.repeat = ImageRepeat.noRepeat, //重复方式
      ...
    })

fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：

    fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
    cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
    contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
    fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
    fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
    none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。

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

![](./README/images/listview_separetor.png)

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


### 编写自定义平台指定代码

Flutter使用灵活的系统，允许您调用特定于平台的API，无论是在Android上的Java或Kotlin代码中，还是在iOS上的Objective-C或Swift代码中。
Flutter的特定于平台的API支持不依赖于代码生成，而是依赖于灵活的消息传递样式：

1. 应用的Flutter部分通过平台频道向其主机（应用的iOS或Android部分）发送消息。

2. 在主机监听的平台通道，并接收该消息。然后，它使用本机编程语言调用任意数量的特定于平台的API，并将响应发送回客户端，即应用程序的Flutter部分。


![](./README/images/PlatformChannels.png)


消息和响应以异步方式传递，以确保用户界面保持响应。

在客户端，MethodChannel（API）允许发送与方法调用相对应的消息。在平台方面，MethodChannel 在Android（API）和FlutterMethodChanneliOS（API）上启用接收方法调用并发回结果。

参考网页：https://flutter.dev/docs/development/platform-integration/platform-channels
