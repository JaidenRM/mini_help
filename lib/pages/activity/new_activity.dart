import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/activity/new_activity.dart';
import 'package:mini_help/services/activity/index.dart';

class NewActivityScreen extends StatelessWidget {
  final ActivityService activityService;

  NewActivityScreen({ required this.activityService });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NewActivityForm(activityService: activityService,),
            ]
          ),
        ),
      ),
    );
  }
}