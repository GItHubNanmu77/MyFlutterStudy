import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../network/url_service.dart';

const String Test_Img_Url_1 =
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2182598628,2386834436&fm=26&gp=0.jpg";
const String Test_Img_Url_2 =
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=101360609,1318088876&fm=26&gp=0.jpg";
const String Test_Img_Url_3 =
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2431967597,1819749883&fm=26&gp=0.jpg";
const String Test_Img_Url_4 =
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2730566803,3451839022&fm=26&gp=0.jpg";

// get
Future getRequest(url, formData) async {
  try {
    print("请求开始。。。。。。");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/json");
    if (formData == null) {
      response = await dio.get(servicePath[url]);
    } else {
      response = await dio.get(servicePath[url] + '?data:formData');
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print("接口报错❎❎❎❎❎");
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (error) {
    return print("ERROR❌❌❌❌❌====$error");
  }
}

// post
Future postRequest(url, formData) async {
  try {
    print("请求开始。。。。。。");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/json");
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url] + '?data:formData');
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print("接口报错❎❎❎❎❎");
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (error) {
    return print("ERROR❌❌❌❌❌====$error");
  }
}

// testGetRetunData
Future getTestRequest(url, formData, returnData) async {
 //使用统一测试URL
 url = "testUrl";
  try {
    print("请求开始。。。。。。");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/json");
    if (formData == null) {
      response = await dio.get(servicePath[url]);
    } else {
      response = await dio.get(servicePath[url] + '?data:formData');
    }
    if (response.statusCode == 200) {
      print("请求成功✅✅✅✅✅");
      response.data = returnData;
      return response.data;
    } else {
      print("接口报错❎❎❎❎❎");
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (error) {
    return print("ERROR❌❌❌❌❌====$error");
  }
}

// 首页banner
Future getHomePageData(url, param) async {
  final String url = "https://github.com/GItHubNanmu77/MyFlutterStudy";
  List bannerData = [
    Test_Img_Url_1,
    Test_Img_Url_2,
    Test_Img_Url_3,
    Test_Img_Url_4
  ];
  List collList = [
    {"image": Test_Img_Url_1, "title": "爱德华"},
    {"image": Test_Img_Url_2, "title": "爱尔冯斯"},
    {"image": Test_Img_Url_3, "title": "马斯坦古"},
    {"image": Test_Img_Url_4, "title": "Greed Lee"},
    {"image": Test_Img_Url_3, "title": "火王"},
    {"image": Test_Img_Url_1, "title": "爱德华"},
    {"image": Test_Img_Url_2, "title": "爱尔冯斯"},
    {"image": Test_Img_Url_3, "title": "马斯坦古"},
    {"image": Test_Img_Url_4, "title": "Greed Lee"},
    {"image": Test_Img_Url_3, "title": "火王"}
  ];
  List recommandDataList = [
    {"image": Test_Img_Url_1, "price": "123", "oldPrice":212},
    {"image": Test_Img_Url_2, "price": "123", "oldPrice":212},
    {"image": Test_Img_Url_3, "price": "123", "oldPrice":212},
    {"image": Test_Img_Url_4, "price": "123", "oldPrice":212},
    {"image": Test_Img_Url_3, "price": "123", "oldPrice":212},
    {"image": Test_Img_Url_1, "price": "123", "oldPrice":212},
    {"image": Test_Img_Url_2, "price": "123", "oldPrice":212},
    {"image": Test_Img_Url_3, "price": "123", "oldPrice":212},
    {"image": Test_Img_Url_4, "price": "123", "oldPrice":212},
    {"image": Test_Img_Url_3, "price": "123", "oldPrice":212},
  ];
  Map allData = {"banner": bannerData, "list": collList, "recommandDataList":recommandDataList};

  return getTestRequest(url, param, allData);
}
