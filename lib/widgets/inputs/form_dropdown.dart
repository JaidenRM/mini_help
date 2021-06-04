import 'package:flutter/material.dart';

class DropdownFormInput<T> extends StatelessWidget {
  final String? labelText;
  final List<DropdownMenuItem<T>> items;

  DropdownFormInput({ required this.items, this.labelText });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: labelText,
      ),
      items: items,
    );
  }
}