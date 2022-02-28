// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdaptAdapter extends TypeAdapter<TaskAdapt> {
  @override
  final int typeId = 1;

  @override
  TaskAdapt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskAdapt(
      title: fields[0] as String,
      description: fields[1] as String,
      type: fields[2] as int,
      status: fields[3] as int,
      fulfillmentDate: fields[4] as DateTime,
      responsable: fields[5] as String,
      author: fields[6] as String,
      project: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TaskAdapt obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.fulfillmentDate)
      ..writeByte(5)
      ..write(obj.responsable)
      ..writeByte(6)
      ..write(obj.author)
      ..writeByte(7)
      ..write(obj.project);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdaptAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
