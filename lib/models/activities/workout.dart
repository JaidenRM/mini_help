import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/activities/exercise.dart';

part 'workout.g.dart';

@HiveType(typeId: 4)
class Workout extends Activity {
  @HiveField(2)
  List<Exercise> exercises;

  Workout({ 
    required this.exercises,
    required DateTime createdOn, required String name, 
  }) : super(
    createdOn: createdOn,
    name: name,
  );
}