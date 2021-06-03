import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewActivityScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Activity'),
      ),
      body: Text('My form goes here'),
    );
  }
}