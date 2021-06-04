import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_dropdown.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

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
          TextFormInput(
            labelText: 'Title',
          ),
          DropdownFormInput(
            items: [],
            labelText: 'Type',
          ),
          Container(),
          Row(
            children: [
              PrimaryButton('Cancel', (){}),
              PrimaryButton('Submit', () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger
                    .of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              }),
            ],
          ),
        ],
      )
    );
  }
}
