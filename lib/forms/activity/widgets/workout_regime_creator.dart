import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/activity_types/workout/index.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/activities/workout_regime.dart';
import 'package:mini_help/pages/workout/new_workout_regime.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class WorkoutRegimeCreator extends StatefulWidget {
  final void Function(Activity) updateState;

  WorkoutRegimeCreator({ required this.updateState });

  @override
  State<StatefulWidget> createState() => _WorkoutRegimeCreatorState();
}

class _WorkoutRegimeCreatorState extends State<WorkoutRegimeCreator> {
  WorkoutRegime? _workoutRegime;

  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (_) {
        if (_workoutRegime != null) widget.updateState(_workoutRegime!);
      },
      builder: (builder) { 
        return Container(
          child: Column(
            children: [
              if (_workoutRegime != null) Text(_workoutRegime?.name ?? 'Workout Regime 1'),
              PrimaryButton('New Workout Regime', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewWorkoutRegimeScreen(widget.updateState,)),
                );
              }),
            ],
          )
        );
      }
    );
  }
}

class NewWorkoutActivityForm {
}