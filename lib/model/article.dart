import 'package:qiita_flutter/model/user.dart';

class Article {
  final String title;
  final String url;
  final User user;

  Article({this.title, this.url, this.user});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      url: json['url'],
      user: User.fromJson(json['user']),
    );
  }
}
