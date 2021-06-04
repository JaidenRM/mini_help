import 'package:flutter/cupertino.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class WorkoutListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Workouts:'),
          ListView(
            children: [],
          ),
          PrimaryButton('(+) Add New Workout', (){}),
        ]
      ),
    );
  }
}