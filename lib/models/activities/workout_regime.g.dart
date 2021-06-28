// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_regime.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutRegimeAdapter extends TypeAdapter<WorkoutRegime> {
  @override
  final int typeId = 2;

  @override
  WorkoutRegime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutRegime(
      name: fields[0] as String,
      createdOn: fields[1] as DateTime,
      frequency: fields[2] as int?,
      frequencyType: fields[3] as Frequency?,
      goal: fields[4] as String?,
      workouts: (fields[5] as List?)?.cast<Workout>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutRegime obj) {
    writer
      ..writeByte(6)
      ..writeByte(2)
      ..write(obj.frequency)
      ..writeByte(3)
      ..write(obj.frequencyType)
      ..writeByte(4)
      ..write(obj.goal)
      ..writeByte(5)
      ..write(obj.workouts)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.createdOn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutRegimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
