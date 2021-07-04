import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_help/pages/home/index.dart';
import 'package:mini_help/utils/constants/index.dart';
import 'enums/frequency.dart';
import 'models/workout/exercise_template.dart';
import 'models/workout/exercise.dart';
import 'models/workout/workout.dart';
import 'models/workout/workout_exercise.dart';
import 'models/workout/workout_template.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(WorkoutAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  Hive.registerAdapter(FrequencyAdapter());
  Hive.registerAdapter(WorkoutExerciseAdapter());
  Hive.registerAdapter(WorkoutTemplateAdapter());
  Hive.registerAdapter(ExerciseTemplateAdapter());
  // open any boxes here ue to async nature
  await Hive.openBox<Workout>(HBOX_ACT_WORKOUT);
  await Hive.openBox<WorkoutTemplate>(HBOX_TMP_WORKOUT);
  await Hive.openBox<ExerciseTemplate>(HBOX_TMP_EXERCISE);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Help',
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}