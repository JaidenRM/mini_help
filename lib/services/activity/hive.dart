import 'package:hive_flutter/adapters.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/activities/reminder.dart';
import 'package:mini_help/models/activities/workout.dart';
import 'package:mini_help/utils/constants/index.dart';
import 'index.dart';

class HiveActivityService extends ActivityService {
  @override
  List<Activity> getAllActivities() {
    List<Activity> activities = [];
    var reminders = Hive.box<Reminder>(HIVE_BOX_REMINDER);
    var workouts = Hive.box<Workout>(HIVE_BOX_WORKOUT);
    
    activities.addAll(reminders.values);
    activities.addAll(workouts.values);

    return activities;
  }

  @override
  void saveActivity(Activity activity) {
    if (activity.isInBox) {
      activity.save();
    } else if (activity is Reminder) {
      var reminders = Hive.box<Reminder>(HIVE_BOX_REMINDER);
      reminders.add(activity);
    } else if (activity is Workout) {
      var workouts = Hive.box<Workout>(HIVE_BOX_WORKOUT);
      workouts.add(activity);
    }
  }

}