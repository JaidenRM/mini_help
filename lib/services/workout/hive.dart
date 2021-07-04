import 'package:hive_flutter/adapters.dart';
import 'package:mini_help/models/workout/workout.dart';
import 'package:mini_help/models/workout/workout_template.dart';
import 'package:mini_help/utils/constants/index.dart';
import 'index.dart';

class HiveWorkoutService extends WorkoutService {
  @override
  List<Workout> getAllWorkouts() {
    return Hive.box<Workout>(HBOX_ACT_WORKOUT).values.toList();
  }

  @override
  void saveWorkout(Workout workout) {
    if (workout.isInBox) {
      workout.save();
    } else {
      var workouts = Hive.box<Workout>(HBOX_ACT_WORKOUT);
      workouts.add(workout);
    }
  }

  @override
  List<WorkoutTemplate> getAllTemplates() {
    return Hive.box<WorkoutTemplate>(HBOX_TMP_WORKOUT).values.toList();
  }

  @override
  void saveTemplate(WorkoutTemplate template) {
    if (template.isInBox) {
      template.save();
    } else {
      var templates = Hive.box<WorkoutTemplate>(HBOX_TMP_WORKOUT);
      templates.add(template);
    }
  }

}