import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final String? labelText, initialValue;
  final TextEditingController? textController;
  final int? minLines, maxLines;
  final void Function(String?)? onChanged;
  final String? Function(String?)? onValidate;
  final TextInputType? textInputType;

  TextFormInput({ 
    this.labelText, this.textController, this.minLines, this.maxLines, 
    this.onChanged, this.onValidate, this.textInputType, this.initialValue,
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
      keyboardType: textInputType,
      initialValue: initialValue,
    );
  }
}