import 'package:hive_flutter/hive_flutter.dart';

part 'hive_box_db.g.dart';

@HiveType(typeId: 1)
class HiveLocalDBModel {
  //
  HiveLocalDBModel(
      {this.connected,
      this.latestDBStoreDate,
      this.goalDailySteps,
      this.datesWithData});

  @HiveField(0)
  Map<String, dynamic>? connected;

  @HiveField(1, defaultValue: "")
  String? latestDBStoreDate;

  @HiveField(2, defaultValue: 0)
  num? goalDailySteps;

  @HiveField(3, defaultValue: [])
  List<String>? datesWithData;
}
