import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_help/models/activities/workout_regime.dart';
import 'package:mini_help/pages/home/index.dart';
import 'package:mini_help/utils/constants/index.dart';

import 'enums/frequency.dart';
import 'models/activities/exercise.dart';
import 'models/activities/reminder.dart';
import 'models/activities/workout.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ReminderAdapter());
  Hive.registerAdapter(WorkoutRegimeAdapter());
  Hive.registerAdapter(WorkoutAdapter());
  Hive.registerAdapter(ExerciseAdapter());
  Hive.registerAdapter(FrequencyAdapter());
  // open any boxes here ue to async nature
  await Hive.openBox<Reminder>(HIVE_BOX_REMINDER);
  await Hive.openBox<WorkoutRegime>(HIVE_BOX_WORKOUT_REGIME);

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