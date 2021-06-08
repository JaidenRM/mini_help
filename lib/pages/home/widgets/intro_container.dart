import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mini_help/clips/clip_bottom_arc.dart';

class IntroContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipBottomArc(),
      child: Container(
        child: Column(
          children: [
            Text(DateFormat.jm().format(DateTime.now())),
            Text(DateFormat.MMMMEEEEd().format(DateTime.now())),
          ],
        ),
        decoration: BoxDecoration(
          // Weather image here
        ),
      )
    );
  }
}