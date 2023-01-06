import 'package:flutter/material.dart';
import 'package:news_flutter_app/screens/tabs_screen.dart';
import 'package:news_flutter_app/theme/theme_dark.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: TabsScreen(),
    );
  }
}
