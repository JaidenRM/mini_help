import 'package:flutter/material.dart';

class DateTimeFormInput extends StatelessWidget {
  final DateTime startRange;
  final DateTime endRange;
  final DateTime? initialDate;
  final void Function(DateTime)? onChanged;

  DateTimeFormInput({ required this.startRange, required this.endRange, this.initialDate, this.onChanged });
  
  @override
  Widget build(BuildContext context) {
    return InputDatePickerFormField(
      firstDate: startRange, 
      lastDate: endRange,
      initialDate: initialDate,
      onDateSubmitted: onChanged,
    );
  }

}