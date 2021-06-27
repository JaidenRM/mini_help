import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/models/activities/workout.dart';
import 'package:mini_help/pages/workout/new_workout.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class WorkoutListView extends StatelessWidget {
  final List<Workout> workouts;
  final Function(Workout) addWorkout;

  WorkoutListView(this.workouts, this.addWorkout);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Workouts:'),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Workout ${index + 1}'),
              );
            },
          ),
          PrimaryButton('(+) Add New Workout', (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewWorkoutScreen(addWorkout,)),
            );
          }),
        ]
      ),
    );
  }
}