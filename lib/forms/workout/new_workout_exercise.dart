import 'package:flutter/material.dart';
import 'package:mini_help/models/workout/exercise_template.dart';
import 'package:mini_help/models/workout/workout_exercise.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_dropdown.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class NewWorkoutExerciseForm extends StatefulWidget {
  final void Function(WorkoutExercise) onSubmit;
  final List<ExerciseTemplate> exerciseTemplates;

  NewWorkoutExerciseForm(this.onSubmit, this.exerciseTemplates);

  @override
  _NewWorkoutExerciseFormState createState() => _NewWorkoutExerciseFormState();
}

class _NewWorkoutExerciseFormState extends State<NewWorkoutExerciseForm> {
  final _formKey = GlobalKey<FormState>();

  ExerciseTemplate? _exercise;
  late int _reps;
  late int _sets;

  @override
  Widget build(BuildContext context) {
    var dropdownItems = widget.exerciseTemplates.map((exercise) => DropdownMenuItem(
      child: Text(exercise.name),
      value: exercise,
    )).toList();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          DropdownFormInput(
            items: dropdownItems,
            labelText: 'Exercise',
            onChanged: (ExerciseTemplate? template) => setState(() { 
              if (template != null) {
                _exercise = template;
              }
            }),
          ),
          TextFormInput(
            labelText: 'Sets: ',
            textInputType: TextInputType.number,
            onValidate: (String? text) {
              var numericText = int.tryParse(text ?? '');
              if (numericText != null) {
                setState(() {
                  _sets = numericText;
                });
              } else {
                return 'Please enter a valid number';
              }
            },
          ),
          TextFormInput(
            labelText: 'Reps: ',
            textInputType: TextInputType.number,
            onValidate: (String? text) {
              var numericText = int.tryParse(text ?? '');
              if (numericText != null) {
                setState(() {
                  _reps = numericText;
                });
              } else {
                return 'Please enter a valid number';
              }
            },
          ),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton('Cancel', (){
                Navigator.pop(context);
              }),
              PrimaryButton('Submit', () {
                if (_formKey.currentState!.validate() && _exercise != null) {
                  ScaffoldMessenger
                    .of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));

                  widget.onSubmit(WorkoutExercise(
                    exercise: _exercise!,
                    sets: _sets,
                    reps: _reps,
                  ));
                  Navigator.pop(context);
                }
              }),
            ],
          ),
          SizedBox(height: 20),
        ],
      )
    );
  }
}
