import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_help/models/workout/workout_exercise.dart';

part 'workout_template.g.dart';

@HiveType(typeId: 4)
class WorkoutTemplate extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<WorkoutExercise> exercises;
  @HiveField(2)
  DateTime createdOn;

  WorkoutTemplate({ 
    required this.exercises, required this.name, required this.createdOn,
  });
}