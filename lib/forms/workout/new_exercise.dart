import 'package:flutter/material.dart';
import 'package:mini_help/models/workout/exercise_template.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class NewExerciseTemplateForm extends StatefulWidget {
  final void Function(ExerciseTemplate) onSubmit;

  NewExerciseTemplateForm(this.onSubmit);

  @override
  _NewExerciseTemplateFormState createState() => _NewExerciseTemplateFormState();
}

class _NewExerciseTemplateFormState extends State<NewExerciseTemplateForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  //late int _reps;
  //late int _sets;

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
          // TextFormInput(
          //   labelText: 'Sets: ',
          //   onValidate: (String? text) {
          //     var numericText = int.tryParse(text ?? '');
          //     if (numericText != null) {
          //       setState(() {
          //         _sets = numericText;
          //       });
          //     } else {
          //       return 'Please enter a valid number';
          //     }
          //   },
          // ),
          // TextFormInput(
          //   labelText: 'Reps: ',
          //   onValidate: (String? text) {
          //     var numericText = int.tryParse(text ?? '');
          //     if (numericText != null) {
          //       setState(() {
          //         _reps = numericText;
          //       });
          //     } else {
          //       return 'Please enter a valid number';
          //     }
          //   },
          // ),
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

                  widget.onSubmit(ExerciseTemplate(
                    name: _name,
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
