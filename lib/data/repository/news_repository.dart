import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/web_services/new_web_services.dart';

class NewsRepository{
   NewsWebServices newsWebServices=NewsWebServices();


  NewsRepository(this.newsWebServices);

  static Future<dynamic> fetchData({required String url, required Map<String, dynamic> query}) async {
    final news=NewsWebServices.getNews(url: url,query: query);
    return news;
    //todo: make list of news but found error
  }
}
