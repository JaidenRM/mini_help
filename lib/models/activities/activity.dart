import 'package:hive_flutter/hive_flutter.dart';

abstract class Activity extends HiveObject {
  
  @HiveField(0)
  String name;
  @HiveField(1)
  DateTime createdOn;

  Activity({ required this.name, required this.createdOn });
}