import 'package:hive_flutter/hive_flutter.dart';
import 'exercise_template.dart';

part 'workout_exercise.g.dart';

@HiveType(typeId: 8)
class WorkoutExercise {
  @HiveField(0)
  ExerciseTemplate exercise;
  @HiveField(1)
  int reps;
  @HiveField(2)
  int sets;

  WorkoutExercise({ required this.exercise, required this.reps, required this.sets});
}