import 'package:flutter/material.dart';

class DropdownFormInput<T> extends StatelessWidget {
  final String? labelText;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final T? startingValue;

  DropdownFormInput({ required this.items, this.labelText, this.onChanged, this.startingValue });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: labelText,
        isDense: true,
      ),
      iconSize: 28,
      items: items,
      value: startingValue,
      onChanged: onChanged,
    );
  }
}