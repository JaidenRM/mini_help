import 'package:flutter/material.dart';
import 'package:mini_help/pages/home/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Help',
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}