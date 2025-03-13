// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adaptors.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class CountryEntityAdapter extends TypeAdapter<CountryEntity> {
  @override
  final int typeId = 0;

  @override
  CountryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryEntity(
      code: fields[0] as String,
      emoji: fields[1] as String,
      name: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CountryEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.emoji)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
