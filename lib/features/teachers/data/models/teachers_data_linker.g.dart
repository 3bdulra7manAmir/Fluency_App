// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teachers_data_linker.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherInfoAdapter extends TypeAdapter<TeacherInfo> {
  @override
  final int typeId = 1;

  @override
  TeacherInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeacherInfo(
      teacherIMGPath: fields[2] as String,
      flagIMGPath: fields[3] as String,
      teacherName: fields[0] as String,
      teacherNameSubtitle: fields[1] as String,
      countryText: fields[4] as String,
      accentText: fields[5] as String,
      videoUrl: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TeacherInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.teacherName)
      ..writeByte(1)
      ..write(obj.teacherNameSubtitle)
      ..writeByte(2)
      ..write(obj.teacherIMGPath)
      ..writeByte(3)
      ..write(obj.flagIMGPath)
      ..writeByte(4)
      ..write(obj.countryText)
      ..writeByte(5)
      ..write(obj.accentText)
      ..writeByte(6)
      ..write(obj.videoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
