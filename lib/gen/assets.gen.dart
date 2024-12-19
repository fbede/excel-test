/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ANAN 2.png
  AssetGenImage get anan2 => const AssetGenImage('assets/images/ANAN 2.png');

  /// File path: assets/images/CIBN Logo 1 1.png
  AssetGenImage get cIBNLogo11 =>
      const AssetGenImage('assets/images/CIBN Logo 1 1.png');

  /// File path: assets/images/CIMA-Logo 2.png
  AssetGenImage get cIMALogo2 =>
      const AssetGenImage('assets/images/CIMA-Logo 2.png');

  /// File path: assets/images/CIS Logo 1 1.png
  AssetGenImage get cISLogo11 =>
      const AssetGenImage('assets/images/CIS Logo 1 1.png');

  /// File path: assets/images/CITN Logo 1 1.png
  AssetGenImage get cITNLogo11 =>
      const AssetGenImage('assets/images/CITN Logo 1 1.png');

  /// File path: assets/images/card_surface.png
  AssetGenImage get cardSurface =>
      const AssetGenImage('assets/images/card_surface.png');

  /// File path: assets/images/coins.png
  AssetGenImage get coins => const AssetGenImage('assets/images/coins.png');

  /// File path: assets/images/game_logo_big.png
  AssetGenImage get gameLogoBig =>
      const AssetGenImage('assets/images/game_logo_big.png');

  /// File path: assets/images/game_logo_small.png
  AssetGenImage get gameLogoSmall =>
      const AssetGenImage('assets/images/game_logo_small.png');

  /// File path: assets/images/icon-1.png
  AssetGenImage get icon1 => const AssetGenImage('assets/images/icon-1.png');

  /// File path: assets/images/icon-2.png
  AssetGenImage get icon2 => const AssetGenImage('assets/images/icon-2.png');

  /// File path: assets/images/icon-3.png
  AssetGenImage get icon3 => const AssetGenImage('assets/images/icon-3.png');

  /// File path: assets/images/icon-4.png
  AssetGenImage get icon4 => const AssetGenImage('assets/images/icon-4.png');

  /// File path: assets/images/icon-5.png
  AssetGenImage get icon5 => const AssetGenImage('assets/images/icon-5.png');

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/information.png
  AssetGenImage get information =>
      const AssetGenImage('assets/images/information.png');

  /// File path: assets/images/leaderboard.png
  AssetGenImage get leaderboard =>
      const AssetGenImage('assets/images/leaderboard.png');

  /// File path: assets/images/product-pic-1 2.png
  AssetGenImage get productPic12 =>
      const AssetGenImage('assets/images/product-pic-1 2.png');

  /// File path: assets/images/user1.png
  AssetGenImage get user1 => const AssetGenImage('assets/images/user1.png');

  /// File path: assets/images/user2.png
  AssetGenImage get user2 => const AssetGenImage('assets/images/user2.png');

  /// File path: assets/images/vs.png
  AssetGenImage get vs => const AssetGenImage('assets/images/vs.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        anan2,
        cIBNLogo11,
        cIMALogo2,
        cISLogo11,
        cITNLogo11,
        cardSurface,
        coins,
        gameLogoBig,
        gameLogoSmall,
        icon1,
        icon2,
        icon3,
        icon4,
        icon5,
        icon,
        information,
        leaderboard,
        productPic12,
        user1,
        user2,
        vs
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
