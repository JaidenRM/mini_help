import 'package:mini_help/models/workout/exercise_template.dart';

abstract class ExerciseService {
  List<ExerciseTemplate> getAllTemplates();
  void saveTemplate(ExerciseTemplate template);
}