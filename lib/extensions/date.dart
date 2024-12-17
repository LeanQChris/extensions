import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

/// Extension for DateTime with BuildContext support
extension DateTimeExtensions on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  String format(String pattern) {
    final formatter = DateFormat(pattern);
    return formatter.format(this);
  }

  /// Get formatted date string based on locale from BuildContext
  String formattedDate(BuildContext context, {String pattern = 'yyyy-MM-dd'}) {
    Locale locale = Localizations.localeOf(context);
    return DateFormat(pattern, locale.toString()).format(this);
  }

  /// Get relative time description (e.g., "5 minutes ago")
  String timeAgo(BuildContext context) {
    Duration difference = DateTime.now().difference(this);

    if (difference.inDays > 8) {
      // Use formatted date if more than a week
      return formattedDate(context);
    } else if (difference.inDays >= 1) {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    } else if (difference.inHours >= 1) {
      return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
    } else if (difference.inMinutes >= 1) {
      return "${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago";
    } else {
      return "Just now";
    }
  }

  /// Check if the DateTime is yesterday
  bool isYesterday() {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Check if the DateTime is in the future
  bool isInFuture() {
    return isAfter(DateTime.now());
  }

  /// Check if the DateTime is in the past
  bool isInPast() {
    return isBefore(DateTime.now());
  }
}
