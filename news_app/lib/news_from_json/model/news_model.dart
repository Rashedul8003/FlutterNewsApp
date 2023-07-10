class NewsModel {
  int? id;
  String? name;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel(
      {this.id,
      this.name,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['author'] = this.author;
  //   data['title'] = this.title;
  //   data['description'] = this.description;
  //   data['url'] = this.url;
  //   data['urlToImage'] = this.urlToImage;
  //   data['publishedAt'] = this.publishedAt;
  //   data['content'] = this.content;
  //   return data;
  // }
}
