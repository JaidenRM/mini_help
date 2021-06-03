import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  
  PrimaryButton(this.label, this.onPressed);
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () { onPressed(); },
      child: Text(label),
    );
  }
}