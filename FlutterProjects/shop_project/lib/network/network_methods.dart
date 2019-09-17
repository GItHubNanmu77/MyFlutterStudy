import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../network/url_service.dart';

Future getHomePageData() async {
  try {
    print("请求开始。。。。。。");
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    dio.options.contentType = ContentType.parse("application/json");
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    //取字典里的homepage对应的URL
    // response = await dio.post(servicePath['testUrl'],data:formData);
    // response = await dio.get(servicePath['testUrl']);
    response = await Dio().get("https://github.com/GItHubNanmu77/MyFlutterStudy");
    if (response.statusCode == 200) {
      List bannerData = [
        "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2182598628,2386834436&fm=26&gp=0.jpg",
        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=101360609,1318088876&fm=26&gp=0.jpg",
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568611726848&di=ca2d1e38a771e79376b3c5c4dd633b48&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F0eabe86ebe33d228f91aa1314f0e7fbabcf282442db84-QtdZsA_fw658",
        "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2431967597,1819749883&fm=26&gp=0.jpg"
      ];
      List collList = [
        {
          "image":
              "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2182598628,2386834436&fm=26&gp=0.jpg",
          "title": "爱德华"
        },
        {
          "image":
              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2730566803,3451839022&fm=26&gp=0.jpg",
          "title": "爱尔冯斯"
        },
        {
          "image":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568611389268&di=b86c75d54e7eaef69ee255e0b96a27f2&imgtype=0&src=http%3A%2F%2Fps3.tgbus.com%2FUploadFiles%2F201111%2F20111121182246834.jpg",
          "title": "马斯坦古"
        },
        {
          "image":
              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=101360609,1318088876&fm=26&gp=0.jpg",
          "title": "Greed Lee"
        },
        {
          "image":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568611451823&di=e352e3379f71b5478fccdad63a66d992&imgtype=0&src=http%3A%2F%2Fimg3.ph.126.net%2FYDsHdY2ugE7bzdepS2qC7Q%3D%3D%2F3368692521274163013.jpg",
          "title": "火王"
        },
        {
          "image":
              "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2182598628,2386834436&fm=26&gp=0.jpg",
          "title": "爱德华"
        },
        {
          "image":
              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2730566803,3451839022&fm=26&gp=0.jpg",
          "title": "爱尔冯斯"
        },
        {
          "image":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568611389268&di=b86c75d54e7eaef69ee255e0b96a27f2&imgtype=0&src=http%3A%2F%2Fps3.tgbus.com%2FUploadFiles%2F201111%2F20111121182246834.jpg",
          "title": "马斯坦古"
        },
        {
          "image":
              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=101360609,1318088876&fm=26&gp=0.jpg",
          "title": "Greed Lee"
        },
        {
          "image":
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1568611451823&di=e352e3379f71b5478fccdad63a66d992&imgtype=0&src=http%3A%2F%2Fimg3.ph.126.net%2FYDsHdY2ugE7bzdepS2qC7Q%3D%3D%2F3368692521274163013.jpg",
          "title": "火王"
        }
      ];
      Map data = {"banner":bannerData, "list": collList};
      response.data = data;
      return response.data;
    } else {
      print("接口报错❎❎❎❎❎");
    }
  } catch (error) {
    return print("ERROR❌❌❌❌❌====$error");
  }
}
