import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/models/workout/exercise_template.dart';
import 'package:mini_help/pages/activity/history_activities.dart';
import 'package:mini_help/pages/activity/new_activity.dart';
import 'package:mini_help/pages/workout/new_exercise.dart';
import 'package:mini_help/pages/workout/new_workout.dart';
import 'package:mini_help/services/exercise/index.dart';
import 'package:mini_help/services/workout/index.dart';
import 'package:mini_help/utils/constants/index.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class ActivityContainer extends StatelessWidget {
  final WorkoutService workoutService;
  final ExerciseService exerciseService;

  ActivityContainer({ required this.workoutService, required this.exerciseService});
  
  void saveExerciseTemplate(ExerciseTemplate template) { 
    exerciseService.saveTemplate(template);
  }
  
  @override
  Widget build(BuildContext context) {
    var workouts = workoutService.getAllWorkouts();

    return Container(
      child: Column(
        children: [
          Text(
            'Today', 
            style: TextStyle(fontSize: SIZE_TITLE)),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(workouts[index].workout.name),
              );
            },
          ),
          PrimaryButton('Activity History', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryActivityScreen(
                workouts: workouts)),
            );
          }),
          PrimaryButton('(+) Add New Activity', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewActivityScreen(
                workoutService: workoutService, 
                exerciseService: exerciseService)),
            );
          }),
          PrimaryButton('(+) Create New Workout Template', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewWorkoutScreen(
                workoutService: workoutService,
                exerciseService: exerciseService,)),
            );
          }),
          PrimaryButton('(+) Create New Exercise Template', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewExerciseTemplateScreen(saveExerciseTemplate)),
            );
          }),
        ],
      ),
    );
  }
}