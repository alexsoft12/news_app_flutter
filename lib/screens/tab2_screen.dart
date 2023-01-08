import 'package:flutter/material.dart';
import 'package:news_flutter_app/model/category_model.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:news_flutter_app/theme/theme_dark.dart';
import 'package:news_flutter_app/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _CategoryLists(),
            (!newsService.isLoading)
                ? Expanded(
                    child: NewsList(
                      articles: newsService.getArticlesBySelectedCategory,
                    ),
                  )
                : const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
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

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _CategoryButton(category: categories[index]),
                const SizedBox(height: 5),
                Text(toFirstUppercase(categories[index].name)),
              ],
            ),
          );
        },
      ),
    );
  }

  String toFirstUppercase(String text) {
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: (category.name == newsService.selectedCategory)
              ? myTheme.colorScheme.secondary
              : Colors.black54,
        ),
      ),
    );
  }
}
