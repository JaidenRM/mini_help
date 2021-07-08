import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/workout/new_workout_template.dart';
import 'package:mini_help/models/workout/workout_template.dart';
import 'package:mini_help/services/exercise/index.dart';
import 'package:mini_help/services/workout/index.dart';

class NewWorkoutTemplateScreen extends StatelessWidget {
  final WorkoutService workoutService;
  final ExerciseService exerciseService;

  NewWorkoutTemplateScreen({ required this.workoutService, required this.exerciseService});

  void saveTemplate(WorkoutTemplate template) {
    workoutService.saveTemplate(template);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Workout Template'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: NewWorkoutTemplateForm(
                saveTemplate,
                exerciseService.getAllTemplates(),
              ),
            )
          ]
        ),
      ),
    );
  }
}