import 'package:flutter/material.dart';
import 'package:news_flutter_app/model/news_models.dart';

class NewsService with ChangeNotifier {
  List<Article> topHeadlines = [];

  NewsService() {
    getTopHeadlines();
  }


  getTopHeadlines () {
    print('Opteniendo datos ...! ');
  }


}
