import 'package:flutter/material.dart';

TextEditingController _usernameController = TextEditingController();

class TextFieldRoute extends StatelessWidget {
  void initState() {
    _usernameController.addListener(() {
      print(_usernameController.text);
    });
    _usernameController.text = "placeholder";
    _usernameController.selection = TextSelection(
        baseOffset: _usernameController.text.length - 4,
        extentOffset: _usernameController.text.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("textFieldPage"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "手机号或邮箱",
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (v) {
                print("onChange : $v");
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "6位以上的密码",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            FocusTestRoute(),
          ],
        ),
      ),
    );
  }
}

/// ----------------------- FocusText -------------------------

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1, //关联focusNode1
            decoration: InputDecoration(labelText: "input1"),
          ),
          TextField(
            focusNode: focusNode2, //关联focusNode2
            decoration: InputDecoration(labelText: "input2"),
          ),
          Builder(
            builder: (ctx) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法
                      FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      // if(null == focusScopeNode){
                      //   focusScopeNode = FocusScope.of(context);
                      // }
                      // focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
