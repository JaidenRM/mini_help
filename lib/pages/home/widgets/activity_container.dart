import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/pages/activity/new_activity.dart';
import 'package:mini_help/services/activity/index.dart';
import 'package:mini_help/utils/constants/index.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class ActivityContainer extends StatelessWidget {
  final ActivityService activityService;

  ActivityContainer({ required this.activityService });
  @override
  Widget build(BuildContext context) {
    var activities = activityService.getAllActivities();

    return Container(
      child: Column(
        children: [
          Text(
            'Today', 
            style: TextStyle(fontSize: SIZE_TITLE)),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: activities.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(activities[index].name),
              );
            },
          ),
          PrimaryButton('(+) Add New Activity', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewActivityScreen(activityService: activityService,)),
            );
          }),
        ],
      ),
    );
  }
}