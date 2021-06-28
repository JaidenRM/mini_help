import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/admin/user.dart';

class Reminder extends Activity {
  String description;
  DateTime remindOn;
  
  Reminder({
    required User createdBy, required DateTime createdOn, required String name, 
    required this.description, required this.remindOn
  }) : super(
    createdBy: createdBy,
    createdOn: createdOn,
    name: name,
  );

  Reminder.activity({
    required this.description, required this.remindOn, Activity? activity
  }) : super(
    createdBy: activity?.createdBy,
    createdOn: activity?.createdOn,
    name: activity?.name,
  );

}