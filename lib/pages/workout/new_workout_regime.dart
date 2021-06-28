import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/activity_types/workout/index.dart';
import 'package:mini_help/models/activities/workout_regime.dart';

class NewWorkoutRegimeScreen extends StatelessWidget {
  final Function(WorkoutRegime) onSubmit;

  NewWorkoutRegimeScreen(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Workout Regime'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WorkoutActivityForm(onSubmit),
            ]
          ),
        ),
      ),
    );
  }
}