// import 'package:flutter/material.dart';
// import 'package:mini_help/models/activities/activity.dart';
// import 'package:mini_help/models/templates/exercise_template.dart';
// import 'package:mini_help/models/templates/workout_template.dart';
// import 'package:mini_help/pages/workout/new_exercise.dart';
// import 'package:mini_help/widgets/buttons/primary/index.dart';

// class WorkoutCreator extends StatefulWidget {
//   final void Function(Activity) updateState;

//   WorkoutCreator({ required this.updateState });

//   @override
//   _WorkoutCreatorState createState() => _WorkoutCreatorState();
// }

// class _WorkoutCreatorState extends State<WorkoutCreator> {
//   List<ExerciseTemplate> _exercises = [];

//   void _addExercise(ExerciseTemplate exercise) {
//     setState(() {
//       _exercises.add(exercise);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FormField(
//       onSaved: (_) {
//         if (_exercises.isNotEmpty) {
//           widget.updateState(WorkoutTemplate(
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
//               Text('Exercises:'),
//               ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: _exercises.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_exercises[index].name),
//                   );
//                 },
//               ),
//               PrimaryButton('(+) Add New Exercise', (){
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => NewExerciseScreen(_addExercise,)),
//                 );
//               }),
//             ]
//           ),
//         );
//       },
//     );
//   }
// }