import 'package:flutter/material.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return const Scaffold(
      body: Center(
        child: Text('Tab1 Screen'),
      ),
    );
  }
}
