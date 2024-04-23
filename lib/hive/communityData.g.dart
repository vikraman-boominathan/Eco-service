// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'communityData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityDataAdapter extends TypeAdapter<CommunityData> {
  @override
  final int typeId = 3;

  @override
  CommunityData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityData(
      date: fields[0] as String,
      communityId: fields[1] as String,
      mixedBags: fields[2] as int,
      glassBags: fields[3] as int,
      plasticBags: fields[4] as int,
      paperBags: fields[5] as int,
      segLfBags: fields[6] as int,
      sanitoryBags: fields[7] as int,
      kgOfGlass: fields[8] as double?,
      kgOfMixed: fields[9] as double?,
      kgOfPlastic: fields[10] as double?,
      kgOfPaper: fields[11] as double?,
      kgOfSegLf: fields[12] as double?,
      kgOfSanitory: fields[13] as double?,
      comments: fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityData obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.communityId)
      ..writeByte(2)
      ..write(obj.mixedBags)
      ..writeByte(3)
      ..write(obj.glassBags)
      ..writeByte(4)
      ..write(obj.plasticBags)
      ..writeByte(5)
      ..write(obj.paperBags)
      ..writeByte(6)
      ..write(obj.segLfBags)
      ..writeByte(7)
      ..write(obj.sanitoryBags)
      ..writeByte(8)
      ..write(obj.kgOfGlass)
      ..writeByte(9)
      ..write(obj.kgOfMixed)
      ..writeByte(10)
      ..write(obj.kgOfPlastic)
      ..writeByte(11)
      ..write(obj.kgOfPaper)
      ..writeByte(12)
      ..write(obj.kgOfSegLf)
      ..writeByte(13)
      ..write(obj.kgOfSanitory)
      ..writeByte(14)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
