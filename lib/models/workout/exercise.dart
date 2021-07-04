import 'package:hive_flutter/hive_flutter.dart';
import 'workout_exercise.dart';

part 'exercise.g.dart';

@HiveType(typeId: 7)
class Exercise {
  @HiveField(0)
  WorkoutExercise exercise;
  @HiveField(1)
  double weightKg;
  @HiveField(2)
  String comment;

  Exercise(this.exercise, this.weightKg, this.comment);
}