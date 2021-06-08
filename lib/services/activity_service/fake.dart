import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/activities/reminder.dart';
import 'package:mini_help/models/admin/user.dart';
import 'package:mini_help/services/activity_service/index.dart';

var fakeUser = User(
  userId: '1',
  firstName: 'Bob',
  lastName: 'Marley',
);

class FakeActivityService extends ActivityService {
  @override
  Future<List<Activity>> getAllActivities() async {
    // Simulate fetch data load time
    await Future.delayed(Duration(milliseconds: 1500));
    return [
      Reminder(
        createdBy: fakeUser, 
        createdOn: DateTime.now(), 
        name: 'Take out the trash!', 
        description: 'Make sure you empty the bin and take out the recycling bin too', 
        remindOn: DateTime.now(),
      ),
      Reminder(
        createdBy: fakeUser, 
        createdOn: DateTime.now(), 
        name: 'LCK', 
        description: 'T1 v GenG tonight!', 
        remindOn: DateTime.now(),
      ),
    ];
  }

}