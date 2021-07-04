// import 'package:flutter/material.dart';
// import 'package:mini_help/enums/activity_type.dart';
// import 'package:mini_help/forms/activity/widgets/reminder_creator.dart';
// import 'package:mini_help/forms/activity/widgets/workout_activity_creator.dart';
// import 'package:mini_help/forms/activity/widgets/workout_creator.dart';
// import 'package:mini_help/models/activities/activity.dart';
// import 'package:mini_help/services/activity/index.dart';
// import 'package:mini_help/services/template/index.dart';

// class ActivityCreator extends StatelessWidget {
//   final ActivityType type;
//   final void Function(Activity) updateState;
//   final WorkoutTemplateService templateService;

//   // Inherited widget??
//   ActivityCreator({ required this.type, required this.updateState, required this.templateService });

//   @override
//   Widget build(BuildContext context) {
//     switch (type) {
//       case ActivityType.workout:
//         return WorkoutActivityCreator(updateState: updateState, templateService: templateService);
//       case ActivityType.reminder:
//         return ReminderCreator(updateState: updateState);
//       default:
//         return Text('Creator could not be found for type: $type');
//     }
//   }
// }