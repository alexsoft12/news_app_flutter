import 'package:flutter/material.dart';
import 'package:news_flutter_app/model/news_models.dart';
import 'package:news_flutter_app/theme/theme_dark.dart';

class NewsList extends StatelessWidget {
  final List<Article> articles;

  const NewsList({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (_, index) {
        return _NewsItem(article: articles[index], index: index);
      },
    );
  }
}

class _NewsItem extends StatelessWidget {
  final Article article;
  final int index;

  const _NewsItem({required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(article: article, index: index),
        _CardTitle(article: article),
        _CardImage(article: article)
      ],
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article article;
  final int index;

  const _TopBarCard({super.key, required this.article, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(color: myTheme.colorScheme.secondary),
          ),
          Text(article.source.name),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article article;

  const _CardTitle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        article.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article article;

  const _CardImage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('article image here'),
    );
  }
}
