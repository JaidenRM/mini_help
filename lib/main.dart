import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: TableCalendar(focusedDay: DateTime.now(), firstDay: DateTime.utc(2020, 1, 1), lastDay: DateTime.utc(2022, 1, 1), calendarFormat: CalendarFormat.week),
        ),
      ),
    );
  }
}