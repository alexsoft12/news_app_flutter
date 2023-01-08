import 'package:flutter/material.dart';
import 'package:news_flutter_app/model/news_models.dart';
import 'package:http/http.dart' as http;

const String _urlNews = "https://newsapi.org/v2";
const String _apiKey = "ec0a3bab21ff4b32b7b250fdabc328fa";
const String _country = 'ar';

class NewsService with ChangeNotifier {
  List<Article> topHeadlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url =
        Uri.parse("$_urlNews/top-headlines?apiKey=$_apiKey&country=$_country");
    final resp = await http.get(url);

    final NewsResponse newsResponse = newsResponseFromJson(resp.body);
    topHeadlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
