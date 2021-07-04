import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_help/models/workout/exercise_template.dart';
import 'package:mini_help/utils/constants/index.dart';
import 'index.dart';

class HiveExerciseService extends ExerciseService {
  @override
  List<ExerciseTemplate> getAllTemplates() {
    var exerciseBox = Hive.box<ExerciseTemplate>(HBOX_TMP_EXERCISE);
    var exercises = exerciseBox.values.toList();
    return exercises;
  }

  @override
  void saveTemplate(ExerciseTemplate template) {
    if (template.isInBox) {
      template.save();
    } else {
      Hive.box<ExerciseTemplate>(HBOX_TMP_EXERCISE).add(template);
    }
  }

}