import 'package:flutter/material.dart';
import 'package:myffapp/Message.dart';

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
      routes: {
        "tip_page": (context) => TipRoute(
              text: "123",
              text2: "123123",
            ),
        "new_page": (context) => NewRoute(),
        "image_page": (context) => ImageAndIconRoute(),
        "tip2": (context) {
          return TipRoute(
            text: ModalRoute.of(context).settings.arguments,
            text2: ModalRoute.of(context).settings.arguments,
          );
        }
      },
      home: MyHomePage(title: ' Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have  times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("go to next page"),
              textColor: Colors.lightBlue,
              onPressed: () async {
                // var result = await Navigator.of(context).pushNamed(
                //   "tip2",
                //   arguments: "qwe",
                Navigator.pushNamed(context, "image_page");
              // }
                // );

                // var result = await Navigator.pushNamed(context, "tip2");
                // var result = await Navigator.push(
                // context,
                //  MaterialPageRoute(
                //    builder: (context) {
                //    return TipRoute(
                //      text: "主页面传值ID=123",
                //      text2: "123123",
                //    );
                //  },
                //  ),
                // );
                //输出`TipRoute`路由返回结果
                // print("路由返回值: $result");
              },
            ),
            Text("打开提示页"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text("this is second page"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
    this.text2,
  }) : super(key: key);
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              Text(text2),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "返回312"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
