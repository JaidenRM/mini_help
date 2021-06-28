import 'package:flutter/material.dart';
import 'package:mini_help/enums/activity_type.dart';
import 'package:mini_help/forms/activity/widgets/reminder_creator.dart';
import 'package:mini_help/forms/activity/widgets/workout_regime_creator.dart';
import 'package:mini_help/models/activities/activity.dart';

class ActivityCreator extends StatelessWidget {
  final ActivityType type;
  final void Function(Activity) updateState;

  // Inherited widget??
  ActivityCreator({ required this.type, required this.updateState });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ActivityType.workoutRegime:
        return WorkoutRegimeCreator(updateState: updateState);
      case ActivityType.reminder:
        return ReminderCreator(updateState: updateState);
      default:
        return Text('Creator could not be found for type: $type');
    }
  }
}