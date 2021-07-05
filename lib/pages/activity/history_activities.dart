import 'package:flutter/material.dart';
import 'package:mini_help/models/workout/workout.dart';
import 'package:mini_help/pages/activity/view_activity.dart';

class HistoryActivityScreen extends StatelessWidget {
  final List<Workout> workouts;

  HistoryActivityScreen({ required this.workouts });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Past activities')),
      body: Container(
        child: SingleChildScrollView(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: workouts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(workouts[index].workout.name),
                subtitle: Text('Date: ${workouts[index].createdOn}, ${workouts[index].exercises.length} exercises'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewActivityScreen(workout: workouts[index],))
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}