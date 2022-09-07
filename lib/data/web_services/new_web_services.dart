import 'package:dio/dio.dart';

class NewsWebServices {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getNews(
      {required String url, required Map<String, dynamic> query}) async {
    Response response = await dio.get(url, queryParameters: query);
    return response;
  }
}
