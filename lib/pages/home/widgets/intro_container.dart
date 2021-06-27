import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mini_help/clips/clip_bottom_arc.dart';
import 'package:mini_help/utils/constants/index.dart';

class IntroContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipBottomArc(),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Text(
                DateFormat.jm().format(DateTime.now()), 
                style: TextStyle(fontSize: SIZE_TITLE),),
              SizedBox(height: 20,),
              Text(
                DateFormat.MMMMEEEEd().format(DateTime.now()), 
                style: TextStyle(fontSize: SIZE_TITLE),),
              SizedBox(height: 20.0),
            ],
          ),
          decoration: BoxDecoration(
            // Weather image here
          ),
        ),
      )
    );
  }
}