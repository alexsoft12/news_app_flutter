import 'package:flutter/material.dart';
import 'package:news_flutter_app/model/news_models.dart';

class NewsList extends StatelessWidget {
  final List<Article> articles;

  const NewsList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (_, index) {
        return Text(articles[index].title);
      },
    );
  }
}
