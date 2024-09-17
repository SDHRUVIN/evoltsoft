import 'dart:async';

import 'package:evoltsoft/core/services/hive_service.dart';
import 'package:evoltsoft/data/local/db/db_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

const platformChannel = MethodChannel('com.iottive.pulse_ring.bluetooth');

/// Note:~ Below [Box] wil be used at [Global] level
Box<HiveLocalDBModel>? globalBoxHiveLocalDBModel;

ValueNotifier<HiveLocalDBModel> globalBoxHiveNotifier =
    ValueNotifier<HiveLocalDBModel>(HiveLocalDBModel());

/// Note:~ Below [Variable] wil be used at [Global] level
HiveLocalDBModel? globalHiveLocalDBModel;

Future<void> openGlobalHiveBoxes() async {
  //
  globalBoxHiveLocalDBModel = await HiveService.openHiveLocalDBModelBoxes();
}

Future<void> clearGlobalHiveBoxes() async {
  //
  await globalBoxHiveLocalDBModel?.clear();
}

Future<void> flushGlobalHiveBoxes() async {
  //
  globalBoxHiveLocalDBModel?.flush();
}
