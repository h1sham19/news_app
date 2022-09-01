import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/web_services/new_web_services.dart';

class NewsRepository{
   NewsWebServices newsWebServices=NewsWebServices();


  NewsRepository(this.newsWebServices);

  Future<dynamic> fetchData(String category) async {
    final news=NewsWebServices.getNews(category);
    return news;
    //todo: make list of news but found error
  }
}
