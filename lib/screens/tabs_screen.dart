import 'package:flutter/material.dart';
import 'package:news_flutter_app/screens/tab1_screen.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        body: _Screens(),
        bottomNavigationBar: _NavigatorBar(),
      ),
    );
  }
}

class _NavigatorBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
      currentIndex: navigationModel.currentScreen,
      onTap: (i) => navigationModel.currentScreen = i,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Para ti',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Encabesados',
        ),
      ],
    );
  }
}

class _Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    //final newsService = Provider.of<NewsService>(context);

    return PageView(
      controller: navigationModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Screen(),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentScreen = 0;

  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  int get currentScreen => _currentScreen;

  set currentScreen(int value) {
    _currentScreen = value;
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOutSine);
    notifyListeners();
  }
}
