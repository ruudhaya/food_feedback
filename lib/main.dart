import 'package:flutter/material.dart';

import 'screens/FoodList.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Feedback',
      home: FoodList(),
    );
  }
}
