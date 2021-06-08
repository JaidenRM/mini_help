import 'package:mini_help/enums/frequency.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/activities/workout.dart';
import 'package:mini_help/models/admin/user.dart';

class WorkoutRegime extends Activity {
  int? frequency;
  Frequency? frequencyType;
  String? goal;
  List<Workout>? workouts;

  WorkoutRegime({ 
    required String name, required User createdBy, required DateTime createdOn, required DateTime lastModified,
    this.frequency, this.frequencyType, this.goal, this.workouts 
  }) : super(
    name: name,
    createdBy: createdBy,
    createdOn: createdOn,
    lastModified: lastModified,
  );
}