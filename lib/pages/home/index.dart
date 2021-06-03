import 'package:flutter/material.dart';
import 'package:mini_help/pages/home/widgets/activity_container.dart';
import 'package:mini_help/pages/home/widgets/intro_container.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          introContainer,
          activityContainer,
        ],
      ),
    );
  }
}