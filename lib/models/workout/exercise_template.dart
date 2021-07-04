import 'package:hive_flutter/hive_flutter.dart';

part 'exercise_template.g.dart';

@HiveType(typeId: 5)
class ExerciseTemplate extends HiveObject {
  @HiveField(0)
  String name;

  ExerciseTemplate({ required this.name });
}