import 'package:flutter/material.dart';
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
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentScreen = 0;

  int get currentScreen => _currentScreen;

  set currentScreen(int value) {
    _currentScreen = value;
    notifyListeners();
  }
}
