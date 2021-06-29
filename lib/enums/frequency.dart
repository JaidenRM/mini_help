import 'package:hive_flutter/hive_flutter.dart';

part 'frequency.g.dart';

@HiveType(typeId: 3)
enum Frequency {
  @HiveField(0)
  hour,
  @HiveField(1)
  day,
  @HiveField(2)
  week,
  @HiveField(3)
  fortnight,
  @HiveField(4)
  month,
  @HiveField(5)
  year,
}

// To assign values to enums use an extension, i.e.:
// extension FrequencyValues on Frequency { /* define method to return vals */ }