import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/services/activity_service/index.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class ActivityContainer extends StatelessWidget {
  final ActivityService activityService;

  ActivityContainer({ required this.activityService });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Today', style: TextStyle(fontSize: 24)),
          FutureBuilder(
            future: activityService.getAllActivities(),
            builder: (BuildContext context, AsyncSnapshot<List<Activity>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting: 
                  return Text('Loading...');
                default:
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].name),
                        );
                      },
                    );
                  }
              }

              return Text('Oops!');
            },
          ),
          PrimaryButton('(+) Add New Activity', (){}),
        ],
      ),
    );
  }
}