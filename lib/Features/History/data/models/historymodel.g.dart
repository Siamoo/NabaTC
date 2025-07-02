// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historymodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistorymodelAdapter extends TypeAdapter<Historymodel> {
  @override
  final int typeId = 1;

  @override
  Historymodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Historymodel(
      name: fields[0] as String,
      description: fields[1] as String,
      occurrence: fields[2] as String,
      causes: fields[3] as String,
      treatment: fields[4] as String,
      date: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Historymodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.occurrence)
      ..writeByte(3)
      ..write(obj.causes)
      ..writeByte(4)
      ..write(obj.treatment)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistorymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
