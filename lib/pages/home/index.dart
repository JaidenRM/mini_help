import 'package:flutter/material.dart';
import 'package:mini_help/pages/home/widgets/workout_container.dart';
import 'package:mini_help/pages/home/widgets/intro_container.dart';
import 'package:mini_help/services/exercise/hive.dart';
import 'package:mini_help/services/workout/hive.dart';

class HomeScreen extends StatelessWidget {
  final _workoutService = HiveWorkoutService();
  final _exerciseService = HiveExerciseService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              IntroContainer(),
              Expanded(
                child: WorkoutContainer(
                  workoutService: _workoutService,
                  exerciseService: _exerciseService,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}