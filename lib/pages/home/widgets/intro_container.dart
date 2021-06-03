import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mini_help/clips/clip_bottom_arc.dart';

Widget introContainer = ClipPath(
  clipper: ClipBottomArc(),
  child: Container(
    child: Column(
      children: [
        Text(DateFormat.jm().format(DateTime.now())),
        Text(DateFormat.MMMMEEEEd().format(DateTime.now())),
      ],
    ),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('Weather image here'),
        fit: BoxFit.cover,
      ),
    ),
  )
);