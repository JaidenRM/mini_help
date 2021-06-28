import 'package:mini_help/models/admin/user.dart';

abstract class Activity {
  String? name;

  User? createdBy;
  DateTime? createdOn;
  DateTime? lastModified;

  Activity({ 
    this.name, this.createdBy, 
    this.createdOn, this.lastModified 
  });
}