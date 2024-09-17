// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_box_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLocalDBModelAdapter extends TypeAdapter<HiveLocalDBModel> {
  @override
  final int typeId = 1;

  @override
  HiveLocalDBModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLocalDBModel(
      connected: (fields[0] as Map?)?.cast<String, dynamic>(),
      latestDBStoreDate: fields[1] == null ? '' : fields[1] as String?,
      goalDailySteps: fields[2] == null ? 0 : fields[2] as num?,
      datesWithData:
          fields[3] == null ? [] : (fields[3] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveLocalDBModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.connected)
      ..writeByte(1)
      ..write(obj.latestDBStoreDate)
      ..writeByte(2)
      ..write(obj.goalDailySteps)
      ..writeByte(3)
      ..write(obj.datesWithData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLocalDBModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
