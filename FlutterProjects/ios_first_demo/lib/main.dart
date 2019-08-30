import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());
void main(List<String> args) {
  new CupertinoApp(
    home: new IosRoute(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      //注册路由表
      routes: {
        "IosRoute": (context) => IosRoute(),
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.list),
                onPressed: () {
                  print("sadsad");
                  Navigator.pushNamed(context, "IosRoute");
                }),
          ],
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}

class IosRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoApp(
      title: "iosdemo",
      home: new CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Cupertino Demo"),
        ),
        child: Center(
          child: CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: Text("Press"),
              onPressed: () {
                print("button");
              }),
        ),
      ),
    );
  }
}
