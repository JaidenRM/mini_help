import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/enums/frequency.dart';
import 'package:mini_help/forms/activity_types/workout/widgets/workout_container.dart';
import 'package:mini_help/models/activities/workout.dart';
import 'package:mini_help/models/activities/workout_regime.dart';
import 'package:mini_help/models/admin/user.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_dropdown.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class WorkoutActivityForm extends StatefulWidget {
  final void Function(WorkoutRegime) onSubmit;

  WorkoutActivityForm(this.onSubmit);

  @override
  _WorkoutActivityFormState createState() => _WorkoutActivityFormState();
}

class _WorkoutActivityFormState extends State<WorkoutActivityForm> {
  final _formKey = GlobalKey<FormState>();

  List<Workout> _workouts = [];
  late String _name;
  int? _frequency;
  Frequency? _frequencyType;
  String? _goals;

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
                return 'Please enter a name';
              }
            },
          ),
          Row(
            children: [
              Text('Frequency: '),
              Flexible(
                child: TextFormInput(
                  onValidate: (String? text) {
                    var numericText = int.tryParse(text ?? '');
                    if (numericText != null) {
                      setState(() {
                        _frequency = numericText;
                      });
                    }
                  },
                ),
              ),
              Text(' times per '),
              Flexible(
                child: DropdownFormInput(
                  onChanged: (int? val) {
                    if (val != null) {
                      setState(() {
                        if (val == 0) {
                          _frequencyType = Frequency.day;
                        }
                        if (val == 1) {
                          _frequencyType = Frequency.week;
                        }
                        if (val == 2) {
                          _frequencyType = Frequency.fortnight;
                        }
                        if (val == 3) {
                          _frequencyType = Frequency.month;
                        }
                      });
                    }
                  },
                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text('day'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text('week'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: Text('fortnight'),
                    ),
                    DropdownMenuItem(
                      value: 3,
                      child: Text('month'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TextFormInput(
            labelText: 'Goals:',
            maxLines: 4,
            onValidate: (String? text) {
              setState(() {
                _goals = text;
              });
            },
          ),
          WorkoutListView(_workouts, _addWorkout),
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

                  widget.onSubmit(WorkoutRegime(
                    name: _name,
                    frequency: _frequency,
                    frequencyType: _frequencyType,
                    goal: _goals,
                    workouts: _workouts,
                    createdOn: DateTime.now(),
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

  void _addWorkout(Workout workout) {
    setState(() {
      _workouts.add(workout);
    });
  }
}
