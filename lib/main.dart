import 'package:flutter/material.dart';
import 'package:news_flutter_app/screens/tabs_screen.dart';
import 'package:news_flutter_app/services/news_service.dart';
import 'package:news_flutter_app/theme/theme_dark.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: myTheme,
        debugShowCheckedModeBanner: false,
        home: TabsScreen(),
      ),
    );
  }
}
