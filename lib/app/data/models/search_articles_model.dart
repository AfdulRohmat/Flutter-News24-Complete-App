class SearchArticlesModel {
  final String author;
  final String title;
  final String img;
  final String url;
  final String publishedAt;

  const SearchArticlesModel({
    required this.author,
    required this.title,
    required this.img,
    required this.url,
    required this.publishedAt,
  });

  // Membuat fakctory constructor untuk mengasosiasikan field model dengan key API
  factory SearchArticlesModel.fromJson(Map<String, dynamic> json) {
    return SearchArticlesModel(
      author: json['author'] != null ? json['author'].toString() : 'No Author',
      title:
          json['title'] != null ? json['title'].toString() : 'Tidak ada Judul',
      img: json['urlToImage'] != null ? json['urlToImage'].toString() : '',
      url: json['url'] != null ? json['url'].toString() : '',
      publishedAt: json['publishedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'author': author != null ? author : 'No Author',
        'title': title != null ? title : 'no title',
        'urlToImage': img != null ? img : 'no image',
        'url': url != null ? url : 'no url',
        'publishedAt': publishedAt != null ? publishedAt : 'no Published At',
      };
}
