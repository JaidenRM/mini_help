import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/workout/new_workout.dart';
import 'package:mini_help/models/activities/workout.dart';

class NewWorkoutScreen extends StatelessWidget {
  final Function(Workout) onSubmit;

  NewWorkoutScreen(this.onSubmit);

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
              NewWorkoutForm(onSubmit),
            ]
          ),
        ),
      ),
    );
  }
}