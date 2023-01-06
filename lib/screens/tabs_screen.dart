import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
