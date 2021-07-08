import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_help/models/workout/workout.dart';

class ViewWorkoutScreen extends StatelessWidget {
  final Workout workout;
  final df = DateFormat('dd-MM-yyyy hh:mm a');

  ViewWorkoutScreen({ required this.workout });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workout: ${workout.workout.name}'),),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text('Completed on: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(df.format(workout.createdOn)),
                ]
              ),
              SizedBox(height: 30),
              ...workout.exercises.map((ex) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text('Exercise: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(ex.exercise.exercise.name)
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text('Sets: ', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(ex.exercise.sets.toString())
                            ]
                          ),
                          Row(
                            children: [
                              Text('Reps: ', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(ex.exercise.reps.toString())
                            ]
                          ),
                          Row(
                            children: [
                              Text('Weight (kg): ', style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(ex.weightKg.toString())
                            ]
                          ),
                        ]
                      ),
                      if (ex.comment.isNotEmpty) Row(
                        children: [
                          SizedBox(height: 10),
                          Text('Comments: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(ex.comment, style: TextStyle(fontStyle: FontStyle.italic)),
                        ]
                      ), 
                      SizedBox(height: 20),
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
