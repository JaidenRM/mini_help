import 'package:mini_help/models/workout/exercise.dart';
import 'package:mini_help/models/workout/exercise_template.dart';
import 'package:mini_help/models/workout/workout.dart';
import 'package:mini_help/models/workout/workout_template.dart';

abstract class WorkoutService {
  List<Workout> getAllWorkouts();
  Exercise? getMostRecentExerciseCompleted(ExerciseTemplate exercise);
  void saveWorkout(Workout workout);
  List<WorkoutTemplate> getAllTemplates();
  void saveTemplate(WorkoutTemplate template);
}