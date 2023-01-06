import 'package:flutter/material.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:news_flutter_app/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return Scaffold(
      body: NewsList(articles: newsService.topHeadlines),
    );
  }
}
