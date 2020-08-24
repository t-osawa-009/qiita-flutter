import 'package:flutter/material.dart';
import 'package:qiita_flutter/service/qiita_service.dart';
import 'package:qiita_flutter/model/article.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class HomeViewModel extends ChangeNotifier {
  List<Article> _articles = [];
  List<Article> get articles => _articles;
  HomeViewModel() {
    fetchArticle();
  }

  void fetchArticle() async {
    Future<List<Article>> future = QiitaService.fetchArticle();
    List<Article> value = await future;
    _articles = value;
    notifyListeners();
  }
}
