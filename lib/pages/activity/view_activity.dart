import 'package:flutter/material.dart';
import 'package:mini_help/models/workout/workout.dart';

class ViewActivityScreen extends StatelessWidget {
  final Workout workout;

  ViewActivityScreen({ required this.workout });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workout: ${workout.workout.name}'),),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Completed on: ${workout.createdOn}'),
              ...workout.exercises.map((ex) {
                return Container(
                  child: Column(
                    children: [
                      Text('Exercise: ${ex.exercise.exercise.name}'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Sets: ${ex.exercise.sets}'),
                          Text('Reps: ${ex.exercise.reps}'),
                          Text('Kgs: ${ex.weightKg}'),
                        ]
                      ),
                      if (ex.comment.isNotEmpty) Text('Comment: ${ex.comment}'), 
                    ],
                  )
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
