import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_help/models/workout/exercise.dart';
import 'package:mini_help/models/workout/workout_exercise.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class ExerciseLayout extends StatefulWidget {
  final void Function(Exercise) addExercise;
  final void Function(WorkoutExercise) removeExercise;
  final WorkoutExercise workoutExercise;

  ExerciseLayout({ 
    required this.addExercise, 
    required this.removeExercise, 
    required this.workoutExercise });

  @override
  _ExerciseLayoutState createState() => _ExerciseLayoutState();
}

class _ExerciseLayoutState extends State<ExerciseLayout> {
  int? _sets;
  int? _reps;
  double? _weight;
  String? _comment;

  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (_) {
        widget.addExercise(Exercise(
          WorkoutExercise(
            exercise: widget.workoutExercise.exercise, 
            reps: _reps!, 
            sets: _sets!), 
          _weight!, 
          _comment!));
      },
      validator: (_) {
        if (_sets == null || _reps == null || _weight == null) {
          return 'Please fill out all fields';
        }
      },
      builder: (builder) {
        return Container(
          child: Column(
            children: [
              GestureDetector(
                child: Icon(Icons.close, size: 56, color: Colors.red[700]),
                onTap: () => widget.removeExercise(widget.workoutExercise),
              ),
              Text(widget.workoutExercise.exercise.name),
              TextFormInput(
                labelText: 'Sets',
                textInputType: TextInputType.number,
                initialValue: widget.workoutExercise.sets.toString(),
                onValidate: (String? text) {
                  var numericText = int.tryParse(text ?? '');
                  if (numericText != null) {
                    _sets = numericText;
                  } else {
                    return 'Please enter a valid number';
                  }
                }
              ),
              TextFormInput(
                labelText: 'Reps',
                textInputType: TextInputType.number,
                initialValue: widget.workoutExercise.reps.toString(),
                onValidate: (String? text) {
                  var numericText = int.tryParse(text ?? '');
                  if (numericText != null) {
                    _reps = numericText;
                  } else {
                    return 'Please enter a valid number';
                  }
                }
              ),
              TextFormInput(
                labelText: 'Weight (kg)',
                textInputType: TextInputType.number,
                onValidate: (String? text) {
                  var numericText = double.tryParse(text ?? '');
                  if (numericText != null) {
                    _weight = numericText;
                  } else {
                    return 'Please enter a valid number';
                  }
                }
              ),
              TextFormInput(
                labelText: 'Comments (optional)',
                onValidate: (String? text) {
                  _comment = text;
                },
              ),
              SizedBox(height: 10),
            ],
          )
        );
      }
    );
  }
}