// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityAdapter extends TypeAdapter<Community> {
  @override
  final int typeId = 1;

  @override
  Community read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Community(
      id: fields[0] as String,
      location: fields[1] as String,
      name: fields[2] as String,
      gate_photo_file_name: fields[3] as String,
      lat: fields[4] as double,
      long: fields[5] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Community obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.gate_photo_file_name)
      ..writeByte(4)
      ..write(obj.lat)
      ..writeByte(5)
      ..write(obj.long);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
