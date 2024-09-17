import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/core/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// set device orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// dependency injection
  await setupLocator();

  /// Load APIs Endpoints
  // await DotEnv().load(fileName: ".env");
  await dotenv.load(fileName: ".env");

  /// Hive service init
  await HiveService.initialise();

  runApp(const MyApp(
    initialRoute: RouteNames.splashViewRoute,
  ));
}
