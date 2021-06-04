import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

class NewWorkoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Workout'),
      ),
      body: Column(
        children: [
          Text('Exercises:'),
          ListView(
            children: [],
          ),
          Row(
            children: [
              PrimaryButton('Cancel', (){}),
              PrimaryButton('Submit', () {}),
            ],
          ),
        ],
      ),
    );
  }
}