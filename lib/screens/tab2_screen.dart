import 'package:flutter/material.dart';
import 'package:news_flutter_app/model/category_model.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _CategoryLists(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Category> categories =
        Provider.of<NewsService>(context).categories;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Icon(categories[index].icon),
              const SizedBox(height: 5),
              Text(categories[index].name),
            ],
          ),
        );
      },
    );
  }
}
