import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_help/models/workout/workout_template.dart';
import 'exercise.dart';

part 'workout.g.dart';

@HiveType(typeId: 6)
class Workout extends HiveObject {
  @HiveField(0)
  DateTime createdOn;
  @HiveField(1)
  WorkoutTemplate workout;
  @HiveField(2)
  List<Exercise> exercises;

  Workout({ 
    required this.workout, required this.exercises, 
    required this.createdOn
  });
}