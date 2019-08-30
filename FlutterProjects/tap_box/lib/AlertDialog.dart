import 'package:flutter/material.dart';

class AlertDialogRoute extends StatefulWidget {
  @override
  _AlertDialogRouteState createState() => _AlertDialogRouteState();
}

class _AlertDialogRouteState extends State<AlertDialogRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("alertDialog"),
        ),
        body: Column(
          children: <Widget>[
            ShowDialogAlert1(),
          ],
        ));
  }
}


class ShowDialogAlert1 extends StatefulWidget {
  @override
  _ShowDialogAlert1State createState() => _ShowDialogAlert1State();
}

class _ShowDialogAlert1State extends State<ShowDialogAlert1> {
  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("showDialog"),
        onPressed: () async {
          bool delete = await showDeleteConfirmDialog1();
          if (delete == null) {
            print("取消删除");
          } else {
            print("确认删除");
          }
        });
  }
}
