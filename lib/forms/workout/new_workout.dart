import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/models/workout/exercise_template.dart';
import 'package:mini_help/models/workout/workout_exercise.dart';
import 'package:mini_help/models/workout/workout_template.dart';
import 'package:mini_help/pages/workout/new_workout_exercise.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class NewWorkoutForm extends StatefulWidget {
  final void Function(WorkoutTemplate) onSubmit;
  final List<ExerciseTemplate> exerciseTemplates;

  NewWorkoutForm(this.onSubmit, this.exerciseTemplates);

  @override
  _NewWorkoutState createState() => _NewWorkoutState();
}

class _NewWorkoutState extends State<NewWorkoutForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;

  final List<WorkoutExercise> _exercises = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormInput(
            labelText: 'Name',
            onValidate: (String? text) {
              if (text != null && text.isNotEmpty) {
                setState(() {
                  _name = text;
                });
              } else {
                return 'Please enter a value';
              }
            },
          ),
          Text('Exercises:'),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _exercises.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_exercises[index].exercise.name),
                subtitle: Text('Sets: ${_exercises[index].sets}, Reps: ${_exercises[index].reps}'),
              );
            },
          ),
          PrimaryButton('(+) Add New Exercise', (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewWorkoutExerciseScreen(
                _addExercise, 
                widget.exerciseTemplates)),
            );
          }),
          Row(
            children: [
              PrimaryButton('Cancel', (){
                Navigator.pop(context);
              }),
              PrimaryButton('Submit', () {
                if (_formKey.currentState!.validate() && _exercises.isNotEmpty) {
                  widget.onSubmit(WorkoutTemplate(
                    exercises: _exercises, 
                    createdOn: DateTime.now(), 
                    name: _name));
                  Navigator.pop(context);
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  void _addExercise(WorkoutExercise ex) {
    setState(() {
      _exercises.add(ex);
    });
  }
}