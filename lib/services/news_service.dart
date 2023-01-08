import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_flutter_app/model/category_model.dart';
import 'package:news_flutter_app/model/news_models.dart';
import 'package:http/http.dart' as http;

const String _urlNews = "https://newsapi.org/v2";
const String _apiKey = "ec0a3bab21ff4b32b7b250fdabc328fa";
const String _country = 'ar';

class NewsService with ChangeNotifier {
  List<Article> topHeadlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(icon: FontAwesomeIcons.building, name: 'business'),
    Category(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    Category(icon: FontAwesomeIcons.addressCard, name: 'general'),
    Category(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    Category(icon: FontAwesomeIcons.vials, name: 'science'),
    Category(icon: FontAwesomeIcons.football, name: 'sports'),
    Category(icon: FontAwesomeIcons.computer, name: 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadlines();
    categories.forEach((category) {
      categoryArticles[category.name] = [];
    });
  }

  List<Article> get getArticlesBySelectedCategory =>
      categoryArticles[selectedCategory]!;

  getTopHeadlines() async {
    final url =
        Uri.parse("$_urlNews/top-headlines?apiKey=$_apiKey&country=$_country");
    final resp = await http.get(url);

    final NewsResponse newsResponse = newsResponseFromJson(resp.body);
    topHeadlines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    final url = Uri.parse(
        "$_urlNews/top-headlines?apiKey=$_apiKey&country=$_country&category=$category");
    final resp = await http.get(url);

    final NewsResponse newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category]!.addAll(newsResponse.articles);

    notifyListeners();
  }

  String get selectedCategory => _selectedCategory;

  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }
}
