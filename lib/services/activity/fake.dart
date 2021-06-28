import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/activities/reminder.dart';

import 'index.dart';

class FakeActivityService extends ActivityService {
  @override
  List<Activity> getAllActivities() {
    return [
      Reminder(
        createdOn: DateTime.now(), 
        name: 'Take out the trash!', 
        description: 'Make sure you empty the bin and take out the recycling bin too', 
        remindOn: DateTime.now(),
      ),
      Reminder(
        createdOn: DateTime.now(), 
        name: 'LCK', 
        description: 'T1 v GenG tonight!', 
        remindOn: DateTime.now(),
      ),
    ];
  }

  @override
  void saveActivity(Activity activity) {
    throw UnimplementedError();
  }

}