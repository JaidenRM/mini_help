import 'package:hive_flutter/adapters.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/activities/reminder.dart';
import 'package:mini_help/utils/constants/index.dart';
import 'index.dart';

class HiveActivityService extends ActivityService {
  @override
  List<Activity> getAllActivities() {
    var reminders = Hive.box<Reminder>(HIVE_BOX_REMINDER);
    return reminders.values.toList();
  }

  @override
  void saveActivity(Activity activity) {
    if (activity.isInBox) {
      activity.save();
    } else if (activity is Reminder) {
      var reminders = Hive.box<Reminder>(HIVE_BOX_REMINDER);
      reminders.add(activity);
    } 
  }

}