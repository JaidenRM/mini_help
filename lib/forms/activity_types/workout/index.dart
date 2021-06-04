import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/activity_types/workout/widgets/workout_container.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_dropdown.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class WorkoutActivityForm extends StatefulWidget {

  @override
  _WorkoutActivityFormState createState() => _WorkoutActivityFormState();
}

class _WorkoutActivityFormState extends State<WorkoutActivityForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormInput(
            labelText: 'Name',
          ),
          Row(
            children: [
              Text('Frequency: '),
              TextFormInput(),
              Text(' times per '),
              DropdownFormInput(
                items: [],
              ),
            ],
          ),
          WorkoutListView(),
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
