import 'package:mini_help/models/admin/user.dart';

abstract class Activity {
  String name;

  User createdBy;
  DateTime createdOn;
  DateTime? lastModified;

  Activity({ 
    required this.name, required this.createdBy, 
    required this.createdOn, this.lastModified 
  });
}