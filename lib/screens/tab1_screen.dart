import 'package:flutter/material.dart';
import 'package:news_flutter_app/model/news_models.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:news_flutter_app/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Article> topHeadlines = Provider.of<NewsService>(context).topHeadlines;

    return Scaffold(
      body: topHeadlines.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : NewsList(articles: topHeadlines),
    );
  }
}
