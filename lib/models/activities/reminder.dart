import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_help/models/activities/activity.dart';

part 'reminder.g.dart';

@HiveType(typeId: 1)
class Reminder extends Activity {
  @HiveField(2)
  String description;
  @HiveField(3)
  DateTime remindOn;
  
  Reminder({
    required DateTime createdOn, required String name, 
    required this.description, required this.remindOn
  }) : super(
    createdOn: createdOn,
    name: name,
  );

}