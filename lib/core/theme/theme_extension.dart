import 'package:flutter/material.dart';
import 'package:market_news_app/core/theme/app_theme.dart';

class AppButtonColors extends ThemeExtension<AppButtonColors> {
  const AppButtonColors({
    required this.textColor,
  });

  final Color? textColor;

  static const light = AppButtonColors(
    textColor: AppTheme.primary,
  );

  static const dark = AppButtonColors(
    textColor: Colors.white,
  );

  @override
  ThemeExtension<AppButtonColors> copyWith({
    Color? textColor,
  }) {
    return AppButtonColors(
      textColor: textColor,
    );
  }

  @override
  ThemeExtension<AppButtonColors> lerp(covariant ThemeExtension<AppButtonColors>? other, double t) {
    if (other is! AppButtonColors) return this;
    return AppButtonColors(textColor: Color.lerp(textColor, other.textColor, t));
  }
}

class DialogBoxColors extends ThemeExtension<DialogBoxColors> {
  const DialogBoxColors({
    required this.primary,
  });

  final Color primary;

  static const light = DialogBoxColors(
    primary: Color(0xFF007AFF),
  );

  static const dark = DialogBoxColors(
    primary: Color(0xFF007AFF),
  );

  @override
  ThemeExtension<DialogBoxColors> copyWith({
    Color? primary,
  }) {
    return DialogBoxColors(
      primary: primary ?? this.primary,
    );
  }

  @override
  ThemeExtension<DialogBoxColors> lerp(covariant ThemeExtension<DialogBoxColors>? other, double t) {
    if (other is! DialogBoxColors) {
      return this;
    }
    return DialogBoxColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
    );
  }
}
