import 'package:flutter/cupertino.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  static List<Widget> children() {
    return [
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
      Image.network(
          'https://flutter.io/assets/homepage/news-2-599aefd56e8aa903ded69500ef4102cdd8f988dab8d9e4d570de18bdb702ffd4.png',
          scale: 1,
          fit: BoxFit.cover),
    ];
  }

  GridView extent = GridView.extent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 1,
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: children());

  GridView count = GridView.count(
    crossAxisCount: 3,
    crossAxisSpacing: 20,
    childAspectRatio: 1,
    mainAxisSpacing: 10,
    padding: const EdgeInsets.all(16.0),
    children: children(),
  );
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("GridView"),
        trailing: CupertinoButton(
          onPressed: (){
            isSelected = !isSelected;
            this.setState((){});
          },
          child: Text(isSelected?"count":"extent"),
        ),
      ),
      child: SafeArea(
        child: Container(child: isSelected?this.extent:this.count),
      ),
    );
  }
}
