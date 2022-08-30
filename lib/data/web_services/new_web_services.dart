import 'package:dio/dio.dart';

class NewsWebServices {
  Dio? dio;

  NewsWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: 'https://newsapi.org',
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000);
    dio = Dio(options);
  }
  Future<List<dynamic>> getNews() async {
    try {
      Response response = await dio!.get("category");
      return response.data;
    } catch (error) {
      print(error.toString());
      return [];
    }
  }
}
