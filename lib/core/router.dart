import 'dart:io';

import 'package:evoltsoft/presentation/dashboard/dashboard_view.dart';
import 'package:evoltsoft/presentation/dashboard/garage/vehicle/vehicle_view.dart';
import 'package:evoltsoft/presentation/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'constants/route_names.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteNames.splashViewRoute:
      return _getPage(
        page: const SplashView(),
        settings: settings,
      );

    case RouteNames.dashboardRoute:
      return _getPage(
        page: const DashboardView(),
        settings: settings,
      );

    case RouteNames.vehicleViewRoute:
      return _getPage(
        page: const VehicleView(),
        settings: settings,
      );

    default:
      return _getPage(
        settings: settings,
        page: const SafeArea(
          top: true,
          child: Scaffold(
            body: Center(
              child: Text("Page Is Not Defined"),
            ),
          ),
        ),
      );
  }
}

PageTransition _getPage({
  required Widget page,
  required RouteSettings settings,
  PageTransitionType transitionType = PageTransitionType.rightToLeft,
}) {
  return PageTransition(
    child: page,
    type: transitionType,
    settings: settings,
    isIos: Platform.isIOS,
  );
}

/*MaterialPageRoute _getPage({
  required Widget page,
  required RouteSettings settings,
}) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => SafeArea(top: false, child: page),
  );
}*/
