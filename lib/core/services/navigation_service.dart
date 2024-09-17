import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void back() {
    return _navigationKey.currentState?.pop();
  }

  Future<dynamic>? next(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? backAndNext(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? backAllAndNext(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}
