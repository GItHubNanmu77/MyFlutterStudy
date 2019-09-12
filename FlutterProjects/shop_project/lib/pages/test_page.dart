import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  TextEditingController typeController = TextEditingController();
  String showText = "欢迎光临";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("测试页"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: "类型选择",
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: _chooseAction,
                child: Text("完成"),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ));
  }

  void _chooseAction() {
    print("正在寻找..........");
    if (typeController.text.toString() == "") {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("输入不能为空"),
              ));
    } else {
      getHttp(typeController.text.toString()).then((value) {
        setState(() {
          showText = typeController.text.toString();
        });
      });
    }
  }

  Future getHttp(String typeText) async {
    try {
      Response response;
      var data = {"name": typeText};
      response = await Dio().get("https://jspang.com", queryParameters: data);

      // "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女"
      print(response.data);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
