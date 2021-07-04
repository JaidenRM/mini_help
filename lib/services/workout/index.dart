import 'package:mini_help/models/workout/workout.dart';
import 'package:mini_help/models/workout/workout_template.dart';

abstract class WorkoutService {
  List<Workout> getAllWorkouts();
  void saveWorkout(Workout workout);
  List<WorkoutTemplate> getAllTemplates();
  void saveTemplate(WorkoutTemplate template);
}