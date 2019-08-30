import 'package:flutter/material.dart';

class ScrollViewRoute  extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; 
    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollView"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              //动态创建一个List<Widget>  
            children: str.split("") 
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(c, textScaleFactor: 2.0,)) 
                .toList(),
            ),
          ),
        ),
      ),
    );
  }
}













