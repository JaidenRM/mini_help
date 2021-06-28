import 'package:mini_help/enums/activity_type.dart';
import 'package:mini_help/models/activities/activity.dart';

abstract class ActivityService {
  Future<List<Activity>> getAllActivities();
  List<String> getAllActivityTypes() {
    return ActivityType.values
      .map((elem) => elem.toValue())
      .toList();
  }
}