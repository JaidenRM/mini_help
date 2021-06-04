import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class NewExerciseForm extends StatefulWidget {

  @override
  _NewExerciseFormState createState() => _NewExerciseFormState();
}

class _NewExerciseFormState extends State<NewExerciseForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormInput(
            labelText: 'Exercise: ',
          ),
          TextFormInput(
            labelText: 'Sets: ',
          ),
          TextFormInput(
            labelText: 'Reps: ',
          ),
          Row(
            children: [
              PrimaryButton('Cancel', (){}),
              PrimaryButton('Submit', () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger
                    .of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              }),
            ],
          ),
        ],
      )
    );
  }
}
