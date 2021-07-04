// import 'package:flutter/material.dart';
// import 'package:mini_help/models/activities/activity.dart';
// import 'package:mini_help/models/activities/exercise_activity.dart';
// import 'package:mini_help/models/activities/workout_activity.dart';
// import 'package:mini_help/models/templates/workout_template.dart';
// import 'package:mini_help/services/template/index.dart';
// import 'package:mini_help/widgets/inputs/form_dropdown.dart';
// import 'package:mini_help/widgets/inputs/form_text.dart';

// class WorkoutActivityCreator extends StatefulWidget {
//   final void Function(Activity) updateState;
//   final WorkoutTemplateService templateService;
//   final List<WorkoutTemplate> workoutTemplates;

//   WorkoutActivityCreator({ required this.updateState, required this.templateService }) 
//     : workoutTemplates = templateService.getAllTemplates();

//   @override
//   _WorkoutActivityCreatorState createState() => _WorkoutActivityCreatorState();
// }

// class _WorkoutActivityCreatorState extends State<WorkoutActivityCreator> {
//   List<ExerciseActivity> _exercises = [];
//   WorkoutTemplate? _workout;

//   @override
//   Widget build(BuildContext context) {
//     var workoutOptions = widget.workoutTemplates.map((e) => DropdownMenuItem(child: Text(e.name), value: e,)).toList();
    
//     return FormField(
//       onSaved: (_) {
//         if (_exercises.isNotEmpty && _workout != null) {
//           widget.updateState(WorkoutActivity(
//             workout: _workout!,
//             exercises: _exercises,
//             createdOn: DateTime.now(),
//             name: '',
//           ));
//         }
//       },
//       builder: (builder) {
//         return Container(
//           child: Column(
//             children: [
//               DropdownFormInput<WorkoutTemplate>(
//                 items: workoutOptions,
//                 labelText: 'Type',
//                 onChanged: (WorkoutTemplate? val) => setState(() => _workout = val),
//                 startingValue: _workout,
//               ),
//               Text('Exercises:'),
//               ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: _workout?.exercises.length ?? 0,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     child: Column(
//                       children: [
//                         Text(_workout!.exercises[index].name),
//                         TextFormInput(
//                           labelText: 'Weight (kg): ',
//                           onValidate: (String? text) {
//                             var numericText = int.tryParse(text ?? '');
//                             if (numericText != null) {
//                               setState(() {
//                                 _exercises.add(ExerciseActivity(
//                                   _workout!.exercises[index], 
//                                   numericText, 
//                                   ''
//                                 ));
//                               });
//                             } else {
//                               return 'Please enter a value';
//                             }
//                           },
//                         )
//                       ]
//                     ),
//                   );
//                 },
//               ),
//             ]
//           ),
//         );
//       },
//     );
//   }
// }