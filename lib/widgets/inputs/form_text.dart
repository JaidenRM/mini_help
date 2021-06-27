import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final String? labelText;
  final TextEditingController? textController;
  final int? minLines, maxLines;
  final void Function(String?)? onChanged;
  final String? Function(String?)? onValidate;

  TextFormInput({ 
    this.labelText, this.textController, this.minLines, this.maxLines, 
    this.onChanged, this.onValidate 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      controller: textController,
      minLines: minLines,
      maxLines: maxLines,
      onChanged: onChanged,
      validator: onValidate,
    );
  }
}