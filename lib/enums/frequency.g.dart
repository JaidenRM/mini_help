// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequency.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FrequencyAdapter extends TypeAdapter<Frequency> {
  @override
  final int typeId = 3;

  @override
  Frequency read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Frequency.hour;
      case 1:
        return Frequency.day;
      case 2:
        return Frequency.week;
      case 3:
        return Frequency.fortnight;
      case 4:
        return Frequency.month;
      case 5:
        return Frequency.year;
      default:
        return Frequency.hour;
    }
  }

  @override
  void write(BinaryWriter writer, Frequency obj) {
    switch (obj) {
      case Frequency.hour:
        writer.writeByte(0);
        break;
      case Frequency.day:
        writer.writeByte(1);
        break;
      case Frequency.week:
        writer.writeByte(2);
        break;
      case Frequency.fortnight:
        writer.writeByte(3);
        break;
      case Frequency.month:
        writer.writeByte(4);
        break;
      case Frequency.year:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FrequencyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
