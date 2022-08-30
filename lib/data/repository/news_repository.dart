import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/data/web_services/new_web_services.dart';

class NewsRepository{
   NewsWebServices newsWebServices=NewsWebServices();


  NewsRepository(this.newsWebServices);

  Future<List<NewsModel>> fetchData() async {
    final news=newsWebServices.getNews();
    return;
  }
}
