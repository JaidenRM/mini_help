import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/activity/new_activity.dart';
import 'package:mini_help/services/exercise/index.dart';
import 'package:mini_help/services/workout/index.dart';

class NewActivityScreen extends StatelessWidget {
  final WorkoutService workoutService;
  final ExerciseService exerciseService;

  NewActivityScreen({ required this.workoutService, required this.exerciseService });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewActivityForm(workoutService: workoutService, exerciseService: exerciseService,),
            ]
          ),
        ),
      ),
    );
  }
}