import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:market_news_app/core/theme/theme_extension.dart';

class AppTheme {
  const AppTheme._();

  static const primary = Color(0xFF523AE4);
  static const primaryContainer = Color(0xFF523AE4);
  static const secondary = Color(0xFF737373);
  static const secondaryContainer = Color(0xFFA3A3A3);
  static const tertiary = Color(0xFFD4D4D4);
  static const tertiaryContainer = Color(0xFF000000);
  static const error = Color(0xffEA0000);

  static const onErrorContainer = Color(0xffFCEEEE);
  static final fontFamily = GoogleFonts.lato().fontFamily;

  static final lightTheme = FlexThemeData.light(
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    colors: flexScheme.light,
    fontFamily: fontFamily,
    textTheme: lightTextTheme,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    onPrimary: primary,
    onPrimaryContainer: primaryContainer,
    onSecondary: secondary,
    onSecondaryContainer: secondaryContainer,
    onTertiary: tertiary,
    onTertiaryContainer: tertiaryContainer,
    onError: error,
    usedColors: 2,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    subThemesData: const FlexSubThemesData(
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      inputCursorSchemeColor: SchemeColor.secondary,
      inputSelectionHandleSchemeColor: SchemeColor.secondary,
      inputSelectionSchemeColor: SchemeColor.secondary,
      inputDecoratorRadius: 8,
      inputDecoratorBorderWidth: 1,
      inputDecoratorFocusedBorderWidth: 1.2,
      inputDecoratorIsFilled: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorBorderSchemeColor: SchemeColor.secondary,
      elevatedButtonRadius: 12,
      elevatedButtonSchemeColor: SchemeColor.primary,
      outlinedButtonRadius: 12,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      cardRadius: 8,
      cardElevation: 0,
    ),
    extensions: [
      AppButtonColors.light,
      DialogBoxColors.light,
    ],
    typography: Typography.material2021(platform: defaultTargetPlatform),
  );

  static final darkTheme = FlexThemeData.dark(
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    colors: flexScheme.dark,
    fontFamily: fontFamily,
    textTheme: darkTextTheme,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    onTertiaryContainer: tertiary,
    usedColors: 2,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    subThemesData: const FlexSubThemesData(
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      inputCursorSchemeColor: SchemeColor.secondary,
      inputSelectionHandleSchemeColor: SchemeColor.secondary,
      inputSelectionSchemeColor: SchemeColor.secondary,
      inputDecoratorRadius: 8,
      inputDecoratorBorderWidth: 1,
      inputDecoratorFocusedBorderWidth: 1.2,
      inputDecoratorIsFilled: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorBorderSchemeColor: SchemeColor.secondary,
      elevatedButtonRadius: 12,
      elevatedButtonSchemeColor: SchemeColor.primary,
      outlinedButtonRadius: 12,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      cardRadius: 8,
      cardElevation: 0,
    ),
    extensions: [
      AppButtonColors.dark,
      DialogBoxColors.dark,
    ],
    typography: Typography.material2021(platform: defaultTargetPlatform),
  );

  // ignore: unused_field
  static const FlexSchemeData flexScheme = FlexSchemeData(
    name: 'Placeholder',
    description: 'Placeholder',
    light: FlexSchemeColor(
      primary: primary,
      primaryContainer: primaryContainer,
      secondary: secondary,
      secondaryContainer: secondaryContainer,
      tertiary: tertiary,
      tertiaryContainer: tertiaryContainer,
      error: error,
    ),
    dark: FlexSchemeColor(
      primary: primary,
      primaryContainer: primaryContainer,
      secondary: secondary,
      secondaryContainer: secondaryContainer,
      tertiary: tertiary,
      tertiaryContainer: tertiaryContainer,
      error: error,
    ),
  );

  /// Text theme for darkTheme
  static TextTheme lightTextTheme = const TextTheme().copyWith(
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),
  );

  /// Text theme for darkTheme
  static TextTheme darkTextTheme = const TextTheme().copyWith(
    headlineLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),
  );
}
