import 'dart:developer';

import 'package:evoltsoft/core/constants/enums.dart';
import 'package:evoltsoft/data/local/db/hive_box_db.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synchronized/synchronized.dart';

class HiveService {
  static HiveService? _singleton;

  // static Hive? _prefs;
  static final Lock _lock = Lock();

  static Future<HiveService> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(
        () async {
          if (_singleton == null) {
            // keep local instance till it is fully initialized.
            var singleton = HiveService._();
            // await singleton._init();
            _singleton = singleton;
          }
        },
      );
    }
    return _singleton!;
  }

  HiveService._();

  /// initialise database service
  static Future<void> initialise() async {
    await Hive.initFlutter();
    await registerAdapters();

    await openHiveLocalDBModelBoxes();
    log("isOpen ${HiveService.isBoxOpen(HiveConstantsBox.hiveBoxDB.name)}");
  }

  /// register all types of type adapters
  static Future<void> registerAdapters() async {
    try {
      Hive.registerAdapter<HiveLocalDBModel>(HiveLocalDBModelAdapter());

      log('Adapters registered successfully', name: "Adapters registered ");
    } catch (e) {
      log('Error registering adapters: $e');
    }
  }

  /// Hive Open Box
  static Future<Box<HiveLocalDBModel>?> openHiveLocalDBModelBoxes() async {
    try {
      log("is Hive Open ${isBoxOpen(HiveConstantsBox.hiveBoxDB.name)}");
      return isBoxOpen(HiveConstantsBox.hiveBoxDB.name)
          ? Hive.box<HiveLocalDBModel>(HiveConstantsBox.hiveBoxDB.name)
          : await Hive.openBox<HiveLocalDBModel>(
              HiveConstantsBox.hiveBoxDB.name);
    } catch (e) {
      log('Error opening box: $e');

      return null;
    }
  }

  //
  // /// get already opened boxes
  // static Future<Box<HiveBoxDB>> getBox() async {
  // }

  /// check the status of box if already opened or not
  static bool isBoxOpen(String key) {
    return Hive.isBoxOpen(key);
  }

  /// delete existing box from memory
  static void deleteBoxFromDisk(String key) async {
    await Hive.deleteBoxFromDisk(key);
  }
}
