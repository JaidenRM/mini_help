import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/workout/new_workout.dart';
import 'package:mini_help/models/workout/workout_template.dart';
import 'package:mini_help/services/exercise/index.dart';
import 'package:mini_help/services/workout/index.dart';
class NewWorkoutScreen extends StatelessWidget {
  final WorkoutService workoutService;
  final ExerciseService exerciseService;

  NewWorkoutScreen({ required this.workoutService, required this.exerciseService});

  void saveTemplate(WorkoutTemplate template) {
    workoutService.saveTemplate(template);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewWorkoutForm(
                saveTemplate,
                exerciseService.getAllTemplates(),
              ),
            ]
          ),
        ),
      ),
    );
  }
}