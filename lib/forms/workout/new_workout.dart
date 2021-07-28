import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_help/forms/workout/widgets/exercise_layout.dart';
import 'package:mini_help/models/workout/exercise.dart';
import 'package:mini_help/models/workout/workout.dart';
import 'package:mini_help/models/workout/workout_exercise.dart';
import 'package:mini_help/models/workout/workout_template.dart';
import 'package:mini_help/pages/workout/new_workout_exercise.dart';
import 'package:mini_help/services/exercise/index.dart';
import 'package:mini_help/services/workout/index.dart';
import 'package:mini_help/widgets/buttons/primary/index.dart';
import 'package:mini_help/widgets/inputs/form_dropdown.dart';

class NewWorkoutForm extends StatefulWidget {
  final WorkoutService workoutService;
  final ExerciseService exerciseService;

  NewWorkoutForm({ required this.workoutService, required this.exerciseService});

  @override
  _NewWorkoutFormState createState() => _NewWorkoutFormState();
}

class _NewWorkoutFormState extends State<NewWorkoutForm> {
  final _formKey = GlobalKey<FormState>();

  WorkoutTemplate? _workout;
  List<WorkoutExercise> _workoutExercises = [];
  final List<Exercise> _exercises = [];

  @override
  Widget build(BuildContext context) {
    var workoutOptions = widget.workoutService
      .getAllTemplates()
      .map((e) => DropdownMenuItem(child: Text(e.name), value: e,))
      .toList();
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            DropdownFormInput<WorkoutTemplate>(
              items: workoutOptions,
              labelText: 'Type',
              onChanged: (WorkoutTemplate? val) => setState(() {
                _workout = val;
                _workoutExercises = val?.exercises ?? [];
              }),
              startingValue: _workout,
            ),
            SizedBox(height: 10),
            Text('Exercises:'),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8.0),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [BoxShadow(
                  offset: Offset(0.5, 0.5),
                  blurRadius: 2.0,
                  spreadRadius: -2.0,
                )],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: _workoutExercises.map((we) {
                    return Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: ExerciseLayout(
                          workoutService: widget.workoutService,
                          addExercise: (Exercise ex) => _exercises.add(ex), 
                          removeExercise: (WorkoutExercise ex) => setState(() => _workoutExercises.remove(ex)),
                          workoutExercise: we),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            PrimaryButton('(+) Add Exercise', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewWorkoutExerciseScreen(
                  (WorkoutExercise ex) { setState(() {
                    _workoutExercises.add(ex);
                  }); },
                  widget.exerciseService.getAllTemplates(),
                )));
            }),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton('Cancel', (){
                  Navigator.pop(context);
                }),
                PrimaryButton('Submit', () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger
                      .of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                    _formKey.currentState!.save();
                    
                    if (_exercises.isNotEmpty && _workout != null) {
                      widget.workoutService.saveWorkout(Workout(
                        createdOn: DateTime.now(),
                        exercises: _exercises,
                        workout: _workout!,
                      ));
                      Navigator.pop(context);
                    }
                  }
                }),
              ],
            ),
          ],
        ),
      )
    );
  }
}
