import 'package:mini_help/models/activities/activity.dart';

abstract class ActivityService {
  Future<List<Activity>> getAllActivities();
}