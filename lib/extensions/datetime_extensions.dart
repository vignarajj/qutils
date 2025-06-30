import 'package:intl/intl.dart';
import '../src/datetime_utils.dart';

/// DateTime extensions for QUtils
/// 
/// Provides convenient extension methods on DateTime objects for formatting,
/// manipulation, and relative time calculations.
extension QDateTimeExtensions on DateTime {
  
  // ======================== FORMATTING ========================
  
  /// Formats this DateTime using the specified format string
  /// 
  /// [format] The format string (uses DateFormat patterns)
  /// [locale] Optional locale for formatting
  /// 
  /// Returns the formatted string
  /// 
  /// Example:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.format('yyyy-MM-dd')); // "2023-12-25"
  /// print(date.format('MMM dd, yyyy')); // "Dec 25, 2023"
  /// ```
  String format(String format, {String? locale}) {
    return DateFormat(format, locale).format(this);
  }
  
  /// Formats this DateTime as ISO8601 string
  /// 
  /// Example:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.toIso8601String()); // "2023-12-25T10:30:00.000Z"
  /// ```
  String toIso() => format(QDateTimeUtils.iso8601);
  
  /// Formats this DateTime as date only (yyyy-MM-dd)
  /// 
  /// Example:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.toDateString()); // "2023-12-25"
  /// ```
  String toDateString() => format(QDateTimeUtils.dateOnly);
  
  /// Formats this DateTime as time only (HH:mm:ss)
  /// 
  /// Example:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.toTimeString()); // "10:30:45"
  /// ```
  String toTimeString() => format(QDateTimeUtils.timeOnly);
  
  /// Formats this DateTime as readable format (MMM dd, yyyy)
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.toReadable()); // "Dec 25, 2023"
  /// ```
  String toReadable() => format(QDateTimeUtils.readable);

  /// Formats this DateTime as readable with time (MMM dd, yyyy HH:mm)
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.toReadableWithTime()); // "Dec 25, 2023 10:30"
  /// ```
  String toReadableWithTime() => format(QDateTimeUtils.readableWithTime);
  
  /// Returns a human-readable relative time string
  ///
  /// Example:
  /// ```dart
  /// final twoHoursAgo = DateTime.now().subtract(Duration(hours: 2));
  /// print(twoHoursAgo.timeAgo()); // "2 hours ago"
  /// ```
  String timeAgo() => QDateTimeUtils.toRelativeTime(this);

  // ======================== PROPERTIES ========================

  /// Check if this DateTime is today
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime.now();
  /// print(date.isToday); // true
  /// ```
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Check if this DateTime is yesterday
  ///
  /// Example:
  /// ```dart
  /// final yesterday = DateTime.now().subtract(Duration(days: 1));
  /// print(yesterday.isYesterday); // true
  /// ```
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year && month == yesterday.month && day == yesterday.day;
  }

  /// Check if this DateTime is tomorrow
  ///
  /// Example:
  /// ```dart
  /// final tomorrow = DateTime.now().add(Duration(days: 1));
  /// print(tomorrow.isTomorrow); // true
  /// ```
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year && month == tomorrow.month && day == tomorrow.day;
  }

  /// Get the name of the day of week
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25); // Monday
  /// print(date.dayName); // "Monday"
  /// ```
  String get dayName => format('EEEE');

  /// Get the short name of the day of week
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25); // Mon
  /// print(date.dayNameShort); // "Mon"
  /// ```
  String get dayNameShort => format('EEE');

  /// Get the name of the month
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25);
  /// print(date.monthName); // "December"
  /// ```
  String get monthName => format('MMMM');

  /// Get the short name of the month
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25);
  /// print(date.monthNameShort); // "Dec"
  /// ```
  String get monthNameShort => format('MMM');

  /// Get the quarter of the year (1-4)
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 7, 15);
  /// print(date.quarter); // 3
  /// ```
  int get quarter => ((month - 1) ~/ 3) + 1;

  /// Get the week of year
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 7, 15);
  /// print(date.weekOfYear); // Week number
  /// ```
  int get weekOfYear {
    final firstDayOfYear = DateTime(year, 1, 1);
    final daysSinceFirstDay = difference(firstDayOfYear).inDays;
    return ((daysSinceFirstDay + firstDayOfYear.weekday) / 7).ceil();
  }

  // ======================== MANIPULATIONS ========================

  /// Get the start of the day (00:00:00)
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25, 15, 30, 45);
  /// print(date.startOfDay); // 2023-12-25 00:00:00.000
  /// ```
  DateTime get startOfDay => DateTime(year, month, day);

  /// Get the end of the day (23:59:59.999)
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25, 15, 30, 45);
  /// print(date.endOfDay); // 2023-12-25 23:59:59.999
  /// ```
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// Get the start of the week (Monday)
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25); // Wednesday
  /// print(date.startOfWeek); // Monday of that week at 00:00:00
  /// ```
  DateTime get startOfWeek {
    final daysFromMonday = weekday - 1;
    return subtract(Duration(days: daysFromMonday)).startOfDay;
  }

  /// Get the end of the week (Sunday)
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25); // Wednesday
  /// print(date.endOfWeek); // Sunday of that week at 23:59:59.999
  /// ```
  DateTime get endOfWeek {
    final daysToSunday = 7 - weekday;
    return add(Duration(days: daysToSunday)).endOfDay;
  }

  /// Get the start of the month
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25);
  /// print(date.startOfMonth); // 2023-12-01 00:00:00.000
  /// ```
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// Get the end of the month
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25);
  /// print(date.endOfMonth); // 2023-12-31 23:59:59.999
  /// ```
  DateTime get endOfMonth => DateTime(year, month + 1, 1).subtract(const Duration(microseconds: 1));

  /// Add months to this DateTime
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25);
  /// print(date.addMonths(2)); // 2024-02-25
  /// ```
  DateTime addMonths(int months) {
    int newMonth = month + months;
    int newYear = year;

    while (newMonth > 12) {
      newMonth -= 12;
      newYear++;
    }
    while (newMonth < 1) {
      newMonth += 12;
      newYear--;
    }

    return DateTime(newYear, newMonth, day, hour, minute, second, millisecond, microsecond);
  }
  
  /// Add years to this DateTime
  ///
  /// Example:
  /// ```dart
  /// final date = DateTime(2023, 12, 25);
  /// print(date.addYears(2)); // 2025-12-25
  /// ```
  DateTime addYears(int years) => DateTime(year + years, month, day, hour, minute, second, millisecond, microsecond);
}

/// Duration extensions for QUtils
/// 
/// Provides convenient extension methods on Duration objects for formatting
/// and human-readable representations.
extension QDurationExtensions on Duration {
  /// Get human readable format of this duration
  ///
  /// Example:
  /// ```dart
  /// final duration = Duration(hours: 2, minutes: 30);
  /// print(duration.humanReadable); // "2h 30m"
  /// ```
  String get humanReadable => QDateTimeUtils.formatDuration(this);

  /// Gets a verbose human-readable string representation of this Duration
  String get verboseHumanReadable => QDateTimeUtils.formatDuration(this, verbose: true);

  /// Gets the total number of weeks in this Duration
  int get inWeeks => inDays ~/ 7;

  /// Checks if this Duration is positive
  bool get isPositive => inMicroseconds > 0;

  /// Checks if this Duration is exactly zero
  bool get isZero => inMicroseconds == 0;

  /// Checks if this Duration is negative
  bool get isNegative => inMicroseconds < 0;
}
