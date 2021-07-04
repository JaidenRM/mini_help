import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/workout/new_workout_exercise.dart';
import 'package:mini_help/models/workout/exercise_template.dart';
import 'package:mini_help/models/workout/workout_exercise.dart';

class NewWorkoutExerciseScreen extends StatelessWidget {
  final Function(WorkoutExercise) onSubmit;
  final List<ExerciseTemplate> exerciseTemplates;

  NewWorkoutExerciseScreen(this.onSubmit, this.exerciseTemplates);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Workout Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewWorkoutExerciseForm(onSubmit, exerciseTemplates),
            ]
          ),
        ),
      ),
    );
  }
}