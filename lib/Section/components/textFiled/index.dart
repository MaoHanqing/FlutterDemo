import 'package:flutter/cupertino.dart';
class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      print(_controller.value);
    });
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("TextField"),
      ),
      child: SafeArea(
        child: GestureDetector(
          child: Container(
          child: CupertinoTextField(
            autofocus: true,
            textInputAction: TextInputAction.join,
            placeholder: "请输入用户名",
            maxLength: 3,
            controller: _controller,
            cursorColor: CupertinoColors.activeBlue,
            // style: TextStyle(
            //   fontSize: 30,
            //   color: CupertinoColors.black
            // ),
            obscureText: true,
          ),
        ),
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        )
      ),
    );
  }
}
