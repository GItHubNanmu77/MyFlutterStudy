import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_project/network/network_methods.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: FutureBuilder(
          future: getHomePageData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // var data = json.decode(snapshot.data.toString());
              List swiperDataList =
                  (snapshot.data["banner"] as List); // 顶部轮播组件数
              List<Map> collDataList =
                  (snapshot.data["list"] as List).cast(); //类别列表
              String imgUrl =
                  "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2182598628,2386834436&fm=26&gp=0.jpg";
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
                  CollectionView(collDataList: collDataList), //gridView
                  AdImageView(imgUrl: imgUrl),
                  LeaderPhone(url: "18696827765"),
                ],
              );
            } else {
              return Center(
                child: Text('加载中'),
              );
            }
          },
        ));
  }
}

// 初始化轮播图组件
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  const SwiperDiy({Key key, this.swiperDataList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    print('设备宽度:${ScreenUtil.screenWidth}');
    print('设备高度:${ScreenUtil.screenHeight}');
    print('设备像素密度:${ScreenUtil.pixelRatio}');
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      color: Colors.lightBlue,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network("${swiperDataList[index]}", fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

/// GridView
class CollectionView extends StatelessWidget {
  final collDataList;
  const CollectionView({Key key, this.collDataList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: List<Widget>.from(collDataList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList()),
      ),
    );
  }

  /// GridView Item
  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: (() {
        print("点击了cell");
      }),
      child: Column(
        children: <Widget>[
          Image.network(item['image'], width: ScreenUtil().setWidth(95),height: ScreenUtil().setHeight(70),),
          Text(item['title'])
        ],
      ),
    );
  }
}

/// 广告图片
class AdImageView extends StatelessWidget {
  final String imgUrl;

  const AdImageView({Key key, this.imgUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: ScreenUtil().setHeight(45),
      child: Image.network(imgUrl, fit: BoxFit.fill),
    );
  }
}

// 拨打电话图片按钮
class LeaderPhone extends StatelessWidget {
  final String url;
  final String imgUrl = "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2730566803,3451839022&fm=26&gp=0.jpg";
  const LeaderPhone({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      height: 150,
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(imgUrl),
      ),
    );
  }
  void _launchURL() async {
    String phone = "tel:" + url;
    String webUrl = "http://www.baidu.com";
    if(await canLaunch(phone)){
      await launch(phone);
    } else {
      throw "URL有误，无法打开";
    }
  }
}
