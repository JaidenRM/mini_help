import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/models/activities/exercise.dart';
import 'package:mini_help/models/activities/workout.dart';
import 'package:mini_help/pages/workout/new_exercise.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class NewWorkoutForm extends StatefulWidget {
  final void Function(Workout) onSubmit;

  NewWorkoutForm(this.onSubmit);

  @override
  _NewWorkoutState createState() => _NewWorkoutState();
}

class _NewWorkoutState extends State<NewWorkoutForm> {
  final _formKey = GlobalKey<FormState>();

  List<Exercise> _exercises = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text('Exercises:'),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _exercises.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_exercises[index].name),
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
                if (_formKey.currentState!.validate() && _exercises.isNotEmpty) {
                  widget.onSubmit(Workout(exercises: _exercises, createdOn: DateTime.now(), name: ''));
                  Navigator.pop(context);
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  void _addExercise(Exercise ex) {
    setState(() {
      _exercises.add(ex);
    });
  }
}