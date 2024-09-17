/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/services.dart';
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// Directory path: assets/fonts/Mulish
  $AssetsFontsMulishGen get mulish => const $AssetsFontsMulishGen();
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/arrow_back.svg
  SvgGenImage get arrowBack => const SvgGenImage('assets/svgs/arrow_back.svg');

  /// List of all assets
  List<SvgGenImage> get values => [arrowBack];
}

class $AssetsFontsMulishGen {
  const $AssetsFontsMulishGen();

  /// File path: assets/fonts/Mulish/Mulish-Black.ttf
  String get mulishBlack => 'assets/fonts/Mulish/Mulish-Black.ttf';

  /// File path: assets/fonts/Mulish/Mulish-Bold.ttf
  String get mulishBold => 'assets/fonts/Mulish/Mulish-Bold.ttf';

  /// File path: assets/fonts/Mulish/Mulish-ExtraBold.ttf
  String get mulishExtraBold => 'assets/fonts/Mulish/Mulish-ExtraBold.ttf';

  /// File path: assets/fonts/Mulish/Mulish-ExtraLight.ttf
  String get mulishExtraLight => 'assets/fonts/Mulish/Mulish-ExtraLight.ttf';

  /// File path: assets/fonts/Mulish/Mulish-Italic.ttf
  String get mulishItalic => 'assets/fonts/Mulish/Mulish-Italic.ttf';

  /// File path: assets/fonts/Mulish/Mulish-Light.ttf
  String get mulishLight => 'assets/fonts/Mulish/Mulish-Light.ttf';

  /// File path: assets/fonts/Mulish/Mulish-Medium.ttf
  String get mulishMedium => 'assets/fonts/Mulish/Mulish-Medium.ttf';

  /// File path: assets/fonts/Mulish/Mulish-Regular.ttf
  String get mulishRegular => 'assets/fonts/Mulish/Mulish-Regular.ttf';

  /// File path: assets/fonts/Mulish/Mulish-SemiBold.ttf
  String get mulishSemiBold => 'assets/fonts/Mulish/Mulish-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
        mulishBlack,
        mulishBold,
        mulishExtraBold,
        mulishExtraLight,
        mulishItalic,
        mulishLight,
        mulishMedium,
        mulishRegular,
        mulishSemiBold
      ];
}

class Assets {
  Assets._();

  static const String countryState = 'assets/country_state.json';
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();

  /// List of all assets
  static List<String> get values => [countryState];
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final BytesLoader loader;
    if (_isVecFormat) {
      loader = AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        // theme: theme,
      );
    }
    return SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
