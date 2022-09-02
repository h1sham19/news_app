class NewsModel{
  String? status;
  List<Sources>? sources;

  NewsModel(this.status, this.sources);

  NewsModel.fromJson(Map<String,dynamic> Json){
    status=Json['status'];
    sources=Json['sources'];

  }
}

class Sources{
  String? uId;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources(this.uId, this.name, this.description, this.url, this.category,
      this.language, this.country);
  Sources.fromJson(Map<String,dynamic> Json){
    name=Json['name'];
    uId=Json['id'];
    description=Json['description'];
    url=Json['url'];
    category=Json['category'];
    country=Json['country'];
    language=Json['language'];


  }
}