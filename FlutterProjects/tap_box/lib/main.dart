import 'package:flutter/material.dart';
import 'package:tap_box/imagePage.dart';
import 'package:tap_box/switchPage.dart';
import 'package:tap_box/boxBPage.dart';
import 'package:tap_box/boxCPage.dart';
import 'package:tap_box/textfieldPage.dart';
import 'package:tap_box/textFormField.dart';
import 'package:tap_box/indicatorPage.dart';
import 'package:tap_box/ScrollView.dart';
import 'package:tap_box/tableView.dart';
import 'package:tap_box/gridView.dart';
import 'package:tap_box/customScrollView.dart';
import 'package:tap_box/scrollController.dart';
import 'package:tap_box/AlertDialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //注册路由表
        routes: {
          "imagePage": (context) => ImageAndIconRoute(),
          "switchPage": (context) => SwitchAndCheckBoxTestRoute(),
          "boxAPage": (context) => TapBoxA(),
          "boxBPage": (context) => ParentWidget(),
          "boxCPage": (context) => ParentWidgetC(),
          "textFieldPage": (context) => TextFieldRoute(),
          "textFormFieldPage": (context) => FormTestRoute(),
          "indicatorPage": (context) => ProgressRoute(),
          "scrollViewPage": (context) => ScrollViewRoute(),
          "tableViewPage": (context) => TableViewPageRoute(),
          "gridViewPage": (context) => GridViewRoute(),
          "customScrollViewPage": (context) => CustomScrollViewDemo(),
          "scrollControllerPage": (context) => ScrollControllerTestRoute(),
          "alertDialogPage": (context) => AlertDialogRoute(),
        },
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Column(
        children: <Widget>[
          TapBoxA(),
          RaisedButton(
              child: Text("switchPage"),
              onPressed: () {
                Navigator.pushNamed(context, "switchPage");
              }),
          RaisedButton(
              child: Text("imagePage"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ImageAndIconRoute()));
              }),
          RaisedButton(
              child: Text("boxBPage"),
              onPressed: () {
                Navigator.pushNamed(context, "boxBPage");
              }),
          RaisedButton(
              child: Text("boxCPage"),
              onPressed: () {
                Navigator.pushNamed(context, "boxCPage");
              }),
          RaisedButton(
              child: Text("textFieldPage"),
              onPressed: () {
                Navigator.pushNamed(context, "textFieldPage");
              }),
          RaisedButton(
              child: Text("textFormFieldPage"),
              onPressed: () {
                Navigator.pushNamed(context, "textFormFieldPage");
              }),
          RaisedButton(
              child: Text("indicatorPage"),
              onPressed: () {
                Navigator.pushNamed(context, "indicatorPage");
              }),
          RaisedButton(
              child: Text("scrollViewPage"),
              onPressed: () {
                Navigator.pushNamed(context, "scrollViewPage");
              }),
          RaisedButton(
              child: Text("tableViewPage"),
              onPressed: () {
                Navigator.pushNamed(context, "tableViewPage");
              }),
          RaisedButton(
              child: Text("gridViewPage"),
              onPressed: () {
                Navigator.pushNamed(context, "gridViewPage");
              }),
          RaisedButton(
              child: Text("customScrollViewPage"),
              onPressed: () {
                Navigator.pushNamed(context, "customScrollViewPage");
              }),
          RaisedButton(
              child: Text("scrollControllerPage"),
              onPressed: () {
                Navigator.pushNamed(context, "scrollControllerPage");
              }),
          RaisedButton(
              child: Text("alertDialogPage"),
              onPressed: () {
                Navigator.pushNamed(context, "alertDialogPage");
              }),
        ],
      ),
    );
  }
}

//---------------------tapBoxA-------------------------
class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _action = false;
  void handleTap() {
    setState(() {
      _action = !_action;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: handleTap,
      child: new Container(
        child: Center(
          child: Text(
            _action ? "action" : "Inactive",
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: _action ? Colors.green : Colors.blueGrey,
        ),
      ),
    );
  }
}
