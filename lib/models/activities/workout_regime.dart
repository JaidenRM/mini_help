import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_help/enums/frequency.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/activities/workout.dart';
import 'package:mini_help/models/admin/user.dart';

part 'workout_regime.g.dart';

@HiveType(typeId: 2)
class WorkoutRegime extends Activity {
  @HiveField(2)
  int? frequency;
  @HiveField(3)
  Frequency? frequencyType;
  @HiveField(4)
  String? goal;
  @HiveField(5)
  List<Workout>? workouts;

  WorkoutRegime({ 
    required String name, required DateTime createdOn,
    this.frequency, this.frequencyType, this.goal, this.workouts 
  }) : super(
    name: name,
    createdOn: createdOn,
  );
}