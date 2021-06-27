import 'package:flutter/material.dart';
import 'package:mini_help/models/activities/exercise.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class NewExerciseForm extends StatefulWidget {
  final void Function(Exercise) onSubmit;

  NewExerciseForm(this.onSubmit);

  @override
  _NewExerciseFormState createState() => _NewExerciseFormState();
}

class _NewExerciseFormState extends State<NewExerciseForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late int _reps;
  late int _sets;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormInput(
            labelText: 'Exercise: ',
            onValidate: (String? text) {
              if (text != null && text.isNotEmpty) {
                setState(() {
                  _name = text;
                });
              } else {
                return 'Please enter a name for this exercise';
              }
            },
          ),
          TextFormInput(
            labelText: 'Sets: ',
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
          Row(
            children: [
              PrimaryButton('Cancel', (){
                Navigator.pop(context);
              }),
              PrimaryButton('Submit', () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger
                    .of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));

                  widget.onSubmit(Exercise(
                    name: _name,
                    sets: _sets,
                    reps: _reps,
                  ));
                  Navigator.pop(context);
                }
              }),
            ],
          ),
        ],
      )
    );
  }
}
