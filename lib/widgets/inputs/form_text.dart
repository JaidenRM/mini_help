import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final String? labelText;
  final TextEditingController? textController;

  TextFormInput({ this.labelText, this.textController });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      controller: textController,
    );
  }
}