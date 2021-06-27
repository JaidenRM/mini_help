import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/enums/activity_type.dart';
import 'package:mini_help/forms/activity/widgets/creator.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/services/activity/index.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_dropdown.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class NewActivityForm extends StatefulWidget {
  final ActivityService activityService;

  NewActivityForm({ required this.activityService });

  @override
  _NewActivityFormState createState() => _NewActivityFormState(activityService);
}

class _NewActivityFormState extends State<NewActivityForm> {
  final _formKey = GlobalKey<FormState>();
  final ActivityService activityService;
  final List<DropdownMenuItem<String>> activityTypeItems;

  String? _activityType;
  String _activityTitle = '';
  Activity? _activity;

  _NewActivityFormState(this.activityService) :
    activityTypeItems = activityService
      .getAllActivityTypes()
      .map((type) => DropdownMenuItem(
        child: Text(type),
        value: type,
      ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            TextFormInput(
              labelText: 'Title',
              onValidate: (String? text) {
                if (text != null && text.isNotEmpty) {
                  setState(() {
                    _activityTitle = text;
                  });
                } else {
                  return 'Please provide a title';
                }
              },
            ),
            DropdownFormInput(
              items: activityTypeItems,
              labelText: 'Type',
              onChanged: (String? val) => setState(() => _activityType = val),
              startingValue: _activityType,
            ),
            ActivityCreator(
              type: (_activityType ?? "").toActivityTypeEnum(), 
              updateState: (Activity activity) {
                setState(() {
                  _activity = activity;
                });
              },
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton('Cancel', (){
                  Navigator.pop(context);
                }),
                PrimaryButton('Submit', () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger
                      .of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                    _formKey.currentState!.save();
                    
                    if (_activity != null) {
                      _activity!.name = _activityTitle;
                      print(_activity);
                    }
                  }
                }),
              ],
            ),
          ],
        ),
      )
    );
  }
}
