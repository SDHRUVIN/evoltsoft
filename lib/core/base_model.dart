import 'package:evoltsoft/core/index.dart';
import 'package:evoltsoft/core/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseModel extends ChangeNotifier {
  CentralViewState _viewState = CentralViewState.idle;

  CentralViewState get viewState => _viewState;
  final NavigationService navigationService = locator<NavigationService>();

  void setViewState(CentralViewState state) {
    if (_viewState != state) _viewState = state;
    if (hasListeners) {
      notifyListeners();
    }
  }

  /// call this function as the initial method of view model.
  @protected
  @mustCallSuper
  void onInit() {}

  /// it will dispose the attached view model from view & the associated disposable elements too.

  @protected
  @mustCallSuper
  void onDispose() {
    dispose();
  }

  @protected
  @mustCallSuper
  void onNotify() {
    if (hasListeners) {
      notifyListeners();
    }
  }

  void navigateTo(String routeName, {dynamic arguments}) {
    navigationService.next(routeName, arguments: arguments);
  }

  void redirectWithClearBackStack(String routeName, {dynamic arguments}) {
    navigationService.backAllAndNext(routeName, arguments: arguments);
  }

  Future<void> redirectToPageWithAwait(String routeName,
      {dynamic arguments}) async {
    await navigationService.next(routeName, arguments: arguments);
    return;
  }

  redirectWithPop(String routeName, {dynamic arguments}) {
    navigationService.backAndNext(routeName, arguments: arguments);
  }

  back() {
    navigationService.back();
  }

  /// The function showToast displays a toast message with a default state of info.
  ///
  /// Args:
  ///   state [ToastStats] : The state parameter is an optional parameter of type
  /// ToastStats. It has a default value of [ToastStats.info]. Defaults to ToastStats
  void showToast(
      {ToastStats state = ToastStats.info,
      String? message,
      Toast toastLength = Toast.LENGTH_SHORT,
      gravity = ToastGravity.BOTTOM}) {
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: toastColor(state),
      textColor: AppColors.white,
      fontSize: 12.0,
    );
  }

  Color toastColor(ToastStats state) {
    return switch (state) {
      ToastStats.info => AppColors.info,
      ToastStats.error => AppColors.error,
      ToastStats.success => AppColors.success,
      ToastStats.warning => AppColors.warning,
    };
  }
}
