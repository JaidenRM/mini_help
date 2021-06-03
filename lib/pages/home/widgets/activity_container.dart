import 'package:flutter/cupertino.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';

Widget activityContainer = Container(
  child: Column(
    children: [
      Text('Today', style: new TextStyle(fontSize: 24)),
      Text('ACTIVITY BOX GOES HERE UWU'),
      PrimaryButton('(+) Add New Activity', (){}),
    ],
  ),
);