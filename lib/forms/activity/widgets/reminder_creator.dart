import 'package:flutter/cupertino.dart';
import 'package:mini_help/models/activities/activity.dart';
import 'package:mini_help/models/activities/reminder.dart';
import 'package:mini_help/widgets/inputs/form_datetime.dart';
import 'package:mini_help/widgets/inputs/form_text.dart';

class ReminderCreator extends StatefulWidget {
  final void Function(Activity) updateState;

  ReminderCreator({ required this.updateState });

  @override
  State<StatefulWidget> createState() => _ReminderCreateState();
}

class _ReminderCreateState extends State<ReminderCreator> {
  String _description = '';
  DateTime _remindOn = DateTime.now();

  final DateTime _dateNow = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (_) {
        widget.updateState(
          Reminder(
            description: _description, 
            remindOn: _remindOn,
            createdOn: DateTime.now(),
            name: '',
          )
        );
      },
      builder: (builder) { 
        return Container(
          child: Column(
            children: [
              TextFormInput(
                labelText: 'Description: ',
                minLines: 4,
                maxLines: 4,
                onValidate: (String? text) {
                  if (text != null && text.isNotEmpty) {
                    setState(() => _description = text);
                  } else {
                    return 'A description is required';
                  }
                },
              ),
              DateTimeFormInput(
                startRange: DateTime(_dateNow.year - 1, _dateNow.month, _dateNow.day),
                endRange: DateTime(_dateNow.year + 5, _dateNow.month, _dateNow.day),
                initialDate: _dateNow,
                onChanged: (DateTime datetime) => setState(() => _remindOn = datetime),
              ),
            ],
          )
        );
      }
    );
  }
}