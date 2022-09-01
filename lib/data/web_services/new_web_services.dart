import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsWebServices {
  static late Dio dio;

  static init()
  {
    dio=Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
        receiveDataWhenStatusError: true
    ));
  }

   static Future<Response> getNews(
      {required String url, required Map<String, dynamic> query}) async {

      Response response = await dio.get(url,queryParameters: query);
      return response;
  }
}
