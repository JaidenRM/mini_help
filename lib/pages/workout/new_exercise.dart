import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/workout/new_exercise.dart';
import 'package:mini_help/models/activities/exercise.dart';

class NewExerciseScreen extends StatelessWidget {
  final Function(Exercise) onSubmit;

  NewExerciseScreen(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewExerciseForm(onSubmit),
            ]
          ),
        ),
      ),
    );
  }
}