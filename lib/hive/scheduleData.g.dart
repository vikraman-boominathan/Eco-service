// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduleData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleDataAdapter extends TypeAdapter<ScheduleData> {
  @override
  final int typeId = 0;

  @override
  ScheduleData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleData(
      communityId: fields[0] as String,
      schedule_id: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.communityId)
      ..writeByte(1)
      ..write(obj.schedule_id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
