import 'package:flutter/material.dart';
import 'package:mini_help/pages/home/widgets/activity_container.dart';
import 'package:mini_help/pages/home/widgets/intro_container.dart';
import 'package:mini_help/services/activity_service/fake.dart';

class HomeScreen extends StatelessWidget {
  final _activityService = FakeActivityService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          IntroContainer(),
          ActivityContainer(activityService: _activityService,),
        ],
      ),
    );
  }
}