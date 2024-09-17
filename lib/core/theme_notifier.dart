import 'package:evoltsoft/core/constants/gen/assets.gen.dart';
import 'package:evoltsoft/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeNotifier with ChangeNotifier {
  late ThemeData _themeData;

  ThemeNotifier() {
    initiateTheme();
  }

  ThemeData get themeData => _themeData;

  void initiateTheme() {
    /// use SchedulerBinding.instance.platformDispatcher.platformBrightness instead of SchedulerBinding.instance.window.platformBrightness
    /// use MediaQueryData.fromView(WidgetsBinding.instance.window).platformBrightness
    /// ThemeData().brightness
    /// Theme.of(context).brightness
    /// MediaQuery.of(context).platformBrightness /// Brightness
    /// == Brightness.light for all above
    //
    // if (MediaQuery.of(context).platformBrightness == Brightness.light) {
    if (true) {
      _themeData = defaultTheme;
    } else {
      _themeData = defaultTheme;
    }
    notifyListeners();
  }

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }

  // final lightTheme = defaultTheme;

  // final darkTheme = defaultTheme;

  static ThemeData defaultTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    focusColor: Colors.transparent,
    hintColor: AppColors.txtDisable,
    disabledColor: AppColors.btnDisable,
    scaffoldBackgroundColor: AppColors.white,
    dividerColor: AppColors.black,
    // useMaterial3: true,
    appBarTheme: const AppBarTheme(
      color: AppColors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    datePickerTheme: DatePickerThemeData(),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryLight,
      error: AppColors.error,
      onError: AppColors.warning,
      surface: AppColors.surface,
      onSurface: AppColors.surfacePrimary,
      surfaceTint: AppColors.surfaceTxt,
      inversePrimary: AppColors.success,
      inverseSurface: AppColors.info,
      onTertiaryContainer: AppColors.txtHead,
      outline: AppColors.txtBorder,
      outlineVariant: AppColors.borderDisable,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.txtHead,
        fontWeight: FontWeight.w700,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 36 ?? SizeConfig.setSp(32).toDouble(),
      ),
      headlineMedium: TextStyle(
        color: AppColors.txtTitle,
        fontWeight: FontWeight.w700,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 30 ?? SizeConfig.setSp(30).toDouble(),
      ),
      headlineSmall: TextStyle(
        color: AppColors.txtHead,
        fontWeight: FontWeight.w700,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 24 ?? SizeConfig.setSp(24).toDouble(),
      ),
      titleLarge: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 22 ?? SizeConfig.setSp(22).toDouble(),
      ),
      titleMedium: TextStyle(
        color: AppColors.txtTitle,
        fontWeight: FontWeight.w600,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 20 ?? SizeConfig.setSp(20).toDouble(),
      ),
      titleSmall: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 18 ?? SizeConfig.setSp(18).toDouble(),
      ),
      labelSmall: TextStyle(
        color: AppColors.txtHead,
        fontWeight: FontWeight.w600,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 18 ?? SizeConfig.setSp(18).toDouble(),
      ),
      displayLarge: TextStyle(
        color: AppColors.txtTitle,
        fontWeight: FontWeight.w400,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 17 ?? SizeConfig.setSp(17).toDouble(),
      ),
      displayMedium: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 16 ?? SizeConfig.setSp(16).toDouble(),
      ),
      displaySmall: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 15 ?? SizeConfig.setSp(15).toDouble(),
      ),
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 14 ?? SizeConfig.setSp(14).toDouble(),
      ),
      bodyMedium: TextStyle(
        color: AppColors.txtTitle,
        fontWeight: FontWeight.w300,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 12 ?? SizeConfig.setSp(12).toDouble(),
      ),
      bodySmall: TextStyle(
        color: AppColors.txtTitle,
        fontWeight: FontWeight.w200,
        fontFamily: Assets.fonts.mulish.mulishExtraLight,
        fontSize: 10 ?? SizeConfig.setSp(10).toDouble(),
      ),
    ),
  );
}
