import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NumExtension on num {
  /// Convert number to currency format
  String toCurrency({String symbol = '\$', String locale = 'en_US'}) {
    return NumberFormat.currency(
      symbol: symbol,
      locale: locale,
    ).format(this);
  }

  /// Convert number to compact format (e.g., 1K, 1M)
  String toCompact({String locale = 'en_US'}) {
    return NumberFormat.compact(locale: locale).format(this);
  }

  /// Convert number to percentage
  String toPercentage({int decimals = 0, String locale = 'en_US'}) {
    return NumberFormat.percentPattern(locale)
        .format(this / 100)
        .replaceAll(RegExp(r'0+%'), '%');
  }

  /// Format number with specific decimal places
  String toDecimal({int decimals = 2, String locale = 'en_US'}) {
    return NumberFormat.decimalPattern(locale).format(this);
  }

  /// Convert to Duration
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get seconds => Duration(seconds: toInt());
  Duration get minutes => Duration(minutes: toInt());
  Duration get hours => Duration(hours: toInt());
  Duration get days => Duration(days: toInt());

  /// Convert to SizedBox (useful for spacing)
  Widget get heightBox => SizedBox(height: toDouble());
  Widget get widthBox => SizedBox(width: toDouble());

  /// Check if number is between a range
  bool isBetween(num start, num end) {
    return this >= start && this <= end;
  }

  /// Ensure number is within a range
  num clamp(num min, num max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }

  /// Convert to radians/degrees
  double get toRadians => this * (pi / 180);
  double get toDegrees => this * (180 / pi);
}
