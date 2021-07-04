import 'package:flutter/material.dart';
import 'package:mini_help/pages/home/widgets/activity_container.dart';
import 'package:mini_help/pages/home/widgets/intro_container.dart';
import 'package:mini_help/services/exercise/hive.dart';
import 'package:mini_help/services/workout/hive.dart';

class HomeScreen extends StatelessWidget {
  final _workoutService = HiveWorkoutService();
  final _exerciseService = HiveExerciseService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          children: [
            IntroContainer(),
            Expanded(
              child: ActivityContainer(
                workoutService: _workoutService,
                exerciseService: _exerciseService,
              )
            ),
          ],
        ),
      ),
    );
  }
}