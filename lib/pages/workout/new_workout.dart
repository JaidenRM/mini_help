import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/models/activities/exercise.dart';
import 'package:mini_help/models/activities/workout.dart';
import 'package:mini_help/pages/workout/new_exercise.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class NewWorkoutScreen extends StatefulWidget {
  final void Function(Workout) onSubmit;

  NewWorkoutScreen(this.onSubmit);

  @override
  _NewWorkoutState createState() => _NewWorkoutState();
}

class _NewWorkoutState extends State<NewWorkoutScreen> {
  List<Exercise> exercises = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Workout'),
      ),
      body: Column(
        children: [
          Text('Exercises:'),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(exercises[index].name),
              );
            },
          ),
          PrimaryButton('(+) Add New Exercise', (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewExerciseScreen(_addExercise,)),
            );
          }),
          Row(
            children: [
              PrimaryButton('Cancel', (){
                Navigator.pop(context);
              }),
              PrimaryButton('Submit', () {
                widget.onSubmit(Workout(exercises: exercises));
                Navigator.pop(context);
                print(Workout(exercises: exercises));
              }),
            ],
          ),
        ],
      ),
    );
  }

  void _addExercise(Exercise ex) {
    setState(() {
      exercises.add(ex);
    });
  }
}