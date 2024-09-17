import 'dart:async';

import 'package:evoltsoft/core/index.dart';

class SplashViewModel extends BaseModel {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3),
        () => navigateTo(RouteNames.dashboardRoute));
  }
}
