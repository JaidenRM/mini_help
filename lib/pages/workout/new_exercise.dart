import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/workout/new_exercise.dart';
import 'package:mini_help/models/workout/exercise_template.dart';

class NewExerciseTemplateScreen extends StatelessWidget {
  final Function(ExerciseTemplate) onSubmit;

  NewExerciseTemplateScreen(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Exercise Template'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: NewExerciseTemplateForm(onSubmit),
            ),
          ]
        ),
      ),
    );
  }
}