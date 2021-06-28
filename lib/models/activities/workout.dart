import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_help/models/activities/exercise.dart';

part 'workout.g.dart';

@HiveType(typeId: 4)
class Workout {
  @HiveField(0)
  List<Exercise> exercises;

  Workout({ required this.exercises });
}