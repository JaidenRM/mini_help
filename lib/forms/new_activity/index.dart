import 'package:flutter/cupertino.dart';

class NewActivityForm extends StatefulWidget {

  @override
  _NewActivityFormState createState() => _NewActivityFormState();
}

class _NewActivityFormState extends State<NewActivityForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          
        ],
      )
    );
  }
}