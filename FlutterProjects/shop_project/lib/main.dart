import 'package:flutter/material.dart';
import 'package:shop_project/pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "商城",
        //去掉右上角的debug
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.lightBlue,
        ),
        home: IndexPage(),
      )
    );
  }
}
