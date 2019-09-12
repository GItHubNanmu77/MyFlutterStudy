import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../network/url_service.dart';

Future getHomePageData() async {
  try {
    print("请求开始。。。。。。");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    var formData = {'lon':'115.02932','lat':'35.76189'};
    //取字典里的homepage对应的URL
    response = await dio.post(servicePath['homePage'],data:formData);
    if (response.statusCode == 200) {
        return response.data;
    } else {
      print("接口报错❎❎❎❎❎");
    }
  } catch (error) {
    return print("ERROR❌❌❌❌❌====$error");
  }
}
 