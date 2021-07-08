import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/models/workout/exercise_template.dart';
import 'package:mini_help/pages/workout/history_workouts.dart';
import 'package:mini_help/pages/workout/new_workout.dart';
import 'package:mini_help/pages/workout/new_exercise.dart';
import 'package:mini_help/pages/workout/new_workout_template.dart';
import 'package:mini_help/services/exercise/index.dart';
import 'package:mini_help/services/workout/index.dart';
import 'package:mini_help/utils/constants/index.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class WorkoutContainer extends StatelessWidget {
  final WorkoutService workoutService;
  final ExerciseService exerciseService;

  WorkoutContainer({ required this.workoutService, required this.exerciseService});
  
  void saveExerciseTemplate(ExerciseTemplate template) { 
    exerciseService.saveTemplate(template);
  }
  
  @override
  Widget build(BuildContext context) {
    var workouts = workoutService.getAllWorkouts();
    workouts.sort((w1, w2) => w2.createdOn.compareTo(w1.createdOn));

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
          Expanded(child: SizedBox()),
          PrimaryButton('Workout History', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryWorkoutScreen(
                workouts: workouts)),
            );
          }),
          SizedBox(height: 10),
          PrimaryButton('New Workout', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewWorkoutScreen(
                workoutService: workoutService, 
                exerciseService: exerciseService)),
            );
          }),
          SizedBox(height: 10),
          PrimaryButton('New Workout Template', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewWorkoutTemplateScreen(
                workoutService: workoutService,
                exerciseService: exerciseService,)),
            );
          }),
          SizedBox(height: 10),
          PrimaryButton('New Exercise Template', () {
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