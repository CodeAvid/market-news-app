import 'dart:developer' as devtools show log;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:market_news_app/core/theme/theme_extension.dart';
import 'package:timeago/timeago.dart' as timeago;

/// An extension on `Object` to provide a `log` method.
extension DevToolsLog on Object? {
  DateTime get _dateTime => DateTime.now();

  String get _time {
    return '${_dateTime.hour}:'
        '${_dateTime.minute}:'
        '${_dateTime.second}';
  }

  /// An extension method on `Object`.
  ///
  /// Logs the current object's `toString()` method to the console.
  void log({StackTrace? stackTrace}) {
    devtools.log(
      '$_time: ${toString()}',
      stackTrace: stackTrace,
      time: _dateTime,
    );
  }
}

/// An extension on `BuildContext` to provide a `theme` getter.
extension ThemeExtension on BuildContext {
  /// Returns the `ThemeData` of the current `BuildContext`.
  ThemeData get theme => Theme.of(this);

  /// Returns the `TextTheme` of the current `BuildContext`.
  TextTheme get textTheme => theme.textTheme;

  /// Returns the `TitleLarge TextTheme` of the current `BuildContext`.
  TextStyle? get titleLarge => theme.textTheme.titleLarge;

  /// Returns the `TitleMedium TextTheme` of the current `BuildContext`.
  TextStyle? get titleMedium => theme.textTheme.titleMedium;

  /// Returns the `TitleSmall TextTheme` of the current `BuildContext`.
  TextStyle? get titleSmall => theme.textTheme.titleSmall;

  /// Returns the `BodyLarge TextTheme` of the current `BuildContext`.
  TextStyle? get bodyLarge => theme.textTheme.bodyLarge;

  /// Returns the `BodyMedium TextTheme` of the current `BuildContext`.
  TextStyle? get bodyMedium => theme.textTheme.bodyMedium;

  /// Returns the `BodySmall TextTheme` of the current `BuildContext`.
  TextStyle? get bodySmall => theme.textTheme.bodySmall;

  /// Returns the `Primary Color` of the current `BuildContext`.
  Color get primaryColor => theme.colorScheme.primary;

  /// Returns the `Primary Color` of the current `BuildContext`.
  Color get primaryContainerColor => theme.colorScheme.primaryContainer;

  /// Returns the `Secondary Color` of the current `BuildContext`.
  Color get secondaryColor => theme.colorScheme.secondary;

  /// Returns the `Secondary Container Color` of the current `BuildContext`.
  Color get secondaryContainerColor => theme.colorScheme.secondaryContainer;

  /// Returns the `Tertiary Color` of the current `BuildContext`.
  Color get tertiaryColor => theme.colorScheme.tertiaryContainer;

  /// Returns the `Dialog Box Colors` of the current `BuildContext`.
  DialogBoxColors get dialogBoxColor => theme.extension<DialogBoxColors>() ?? DialogBoxColors.light;
}

extension IfNullX on Object? {
  /// Returns true if the object is null, else returns the false.
  bool get isNull => this == null;

  /// Returns true if the object is not null, else returns the false.
  bool get isNotNull => this != null;
}

extension MediaQueryExtension on BuildContext {
  double get screenWidth {
    return MediaQuery.sizeOf(this).width;
  }

  double get screenHeight {
    return MediaQuery.sizeOf(this).height;
  }
}

extension CurrencyExtensions on num {
  String asCurrency() {
    switch (this) {
      case >= 1000000:
        return '₦${(this / 1000000.0).toStringAsFixed(2)}M';
      case >= 100000:
        return '₦${(this / 1000.0).toStringAsFixed(0)}K';
      case >= 10000:
        return '₦${(this / 1000.0).toStringAsFixed(0)}K';
      default:
        return '₦${NumberFormat("#,##0.00", "en_US").format(this)}';
    }
  }

  String toFormattedCurrency() {
    return '₦${NumberFormat("#,##0.00", "en_US").format(this)}';
  }
}

extension StringX on String {
  String get toSentenceCase {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get maskTransactionRef {
    return '${substring(0, 4)}...${substring(length - 4)}';
  }
}

extension DateTimeX on DateTime {
  String formatDate([String? pattern]) {
    return DateFormat(pattern ?? 'dd MMM, yyyy').format(this);
  }
}

extension DateTimeExt on DateTime {
  String get formatDateTime {
    final formatter = DateFormat('dd MMM, yyyy, hh:mm a');
    return formatter.format(this);
  }
}

extension AgoTimeExtension on DateTime {
  String toAgoTimeString() {
    final now = DateTime.now();
    final difference = now.difference(this);
    return timeago.format(now.subtract(difference));
  }
}

extension Money on int {
  String toMoney({String currency = 'N'}) {
    return NumberFormat.currency(symbol: currency, decimalDigits: 2).format(this);
  }
}

extension MoneyConverter on num {
  String toMoney() {
    return NumberFormat('#,##0.00').format(this);
  }

  String toMoneyNoDecimal({String currency = ''}) {
    return NumberFormat.currency(symbol: currency, decimalDigits: 0).format(this);
  }
}
