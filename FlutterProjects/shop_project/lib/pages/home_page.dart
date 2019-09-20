import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_project/network/network_methods.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_project/pages/index_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool get wantKeepAlive => true;
  int page = 1;
  List<Map> hotGoodsList = [];
  @override
  void initState() {
    super.initState();
    print("homepage");
    _getHotGoodsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: FutureBuilder(
        future: getHomePageData("test", null),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // var data = json.decode(snapshot.data.toString());
            List swiperDataList = (snapshot.data["banner"] as List); // 顶部轮播组件数
            List<Map> collDataList =
                (snapshot.data["list"] as List).cast(); //类别列表
            String imgUrl = Test_Img_Url_1;
            List recommandDataList =
                (snapshot.data['recommandDataList'] as List).cast(); //推荐列表

            return EasyRefresh(
              child: ListView(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
                  CollectionView(collDataList: collDataList), //gridView
                  AdImageView(imgUrl: imgUrl),
                  LeaderPhone(url: "18696827765"),
                  RecommnadView(recommandDataList: recommandDataList),
                  hotGoodView(),
                ],
              ),
              onRefresh: () async {
                page = 1;
                await Future.delayed(Duration(seconds: 2), () {
                  _getHotGoodsData();
                });
              },
              header: ClassicalHeader(
                refreshText: '下拉刷新',
                refreshingText: '刷新中...',
                refreshedText: '刷新成功',
                refreshReadyText: '释放刷新',
                refreshFailedText: '刷新失败',
              ),
              onLoad: () async {
                await Future.delayed(Duration(seconds: 2), () {
                  _getHotGoodsData();
                });
              },
            );
          } else {
            return Center(
              child: Text('加载中'),
            );
          }
        },
      ),
    );
  }

  //热门数据
  void _getHotGoodsData() {
    getHotGoods("url", page).then((data) {
      print(data);
      List<Map> newGoodsList = (data['data'] as List).cast();
      setState(() {
        if (page == 1) {
          hotGoodsList.clear();
          hotGoodsList.addAll(newGoodsList);
        } else {
          hotGoodsList.addAll(newGoodsList);
        }
        page++;
      });
    });
  }

// 热门专区view
  Widget hotGoodView() {
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList(),
        ],
      ),
    );
  }

  //热门专区标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    child: Text('火爆专区'),
  );

  // 热门流式布局
  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> lsitWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {
            print("点击了火爆商品");
          },
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['image'],
                  width: ScreenUtil().setWidth(375),
                ),
                Text(
                  val['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                    ),
                    Text('￥12313'),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                    ),
                    Text(
                      '￥234234',
                      style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList();
      return Wrap(
        spacing: 2,
        children: lsitWidget,
      );
    } else {
      Text('暂无商品');
    }
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
      color: Colors.orange[100],
      height: ScreenUtil.instance.setHeight(260),
      // padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        // padding: EdgeInsets.all(5.0),
        children: List<Widget>.from(collDataList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList()),
      ),
    );
  }

  /// GridView Item
  Widget _gridViewItemUI(BuildContext context, item) {
    return Container(
      color: Colors.red[100],
      margin: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: (() {
          print("点击了cell");
        }),
        child: Column(
          children: <Widget>[
            Image.network(
              item['image'],
              // width: ScreenUtil.instance.setWidth(95),
              height: ScreenUtil.instance.setHeight(60),
            ),
            Text(item['title'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(28),
                )),
          ],
        ),
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
      width: ScreenUtil.instance.setWidth(750),
      height: ScreenUtil.instance.setHeight(45),
      child: Image.network(imgUrl, fit: BoxFit.fitWidth),
      color: Colors.lightBlue,
    );
  }
}

// 拨打电话图片按钮
class LeaderPhone extends StatelessWidget {
  final String url;
  final String imgUrl =
      "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2730566803,3451839022&fm=26&gp=0.jpg";
  const LeaderPhone({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: ScreenUtil.instance.setHeight(180),
      width: ScreenUtil.instance.setWidth(750),
      color: Colors.green[100],
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(
          imgUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  void _launchURL() async {
    String phone = "tel:" + url;
    String webUrl = "http://www.baidu.com";
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw "URL有误，无法打开";
    }
  }
}

// 推荐列表
class RecommnadView extends StatelessWidget {
  final List recommandDataList;
  const RecommnadView({Key key, this.recommandDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.instance.setHeight(300),
      margin: EdgeInsets.only(top: 10.0),
      color: Colors.cyan[200],
      child: Column(
        children: <Widget>[
          _recommandTitle(),
          _recommendList(),
        ],
      ),
    );
  }

  // 标题
  Widget _recommandTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(16, 5, 0, 5),
      decoration: BoxDecoration(
        color: Colors.cyan,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Text(
        "精品推荐",
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  // List
  Widget _recommendList() {
    return Container(
      height: ScreenUtil.instance.setHeight(250),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommandDataList.length,
        itemBuilder: (context, index) {
          return _recommandItem(index);
        },
      ),
    );
  }

  // item
  Widget _recommandItem(index) {
    return InkWell(
      onTap: (() {
        print("cell点击");
      }),
      child: Container(
        // height: ScreenUtil().setHeight(120),
        // height:120,
        // width: 250,
        width: ScreenUtil.instance.setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          border: Border(right: BorderSide(width: 1, color: Colors.grey)),
        ),
        child: Column(
          children: <Widget>[
            Image.network(
              recommandDataList[index]['image'],
              height: ScreenUtil.instance.setHeight(100),
            ),
            Text('￥' + recommandDataList[index]['price']),
            Text(
              '￥${recommandDataList[index]['oldPrice']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
