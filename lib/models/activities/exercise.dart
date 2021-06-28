import 'package:hive_flutter/hive_flutter.dart';

part 'exercise.g.dart';

@HiveType(typeId: 5)
class Exercise {
  @HiveField(0)
  String name;
  @HiveField(1)
  int sets;
  @HiveField(2)
  int reps;

  Exercise({ required this.name, required this.sets, required this.reps });
}