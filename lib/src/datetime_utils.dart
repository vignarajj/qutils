import 'package:intl/intl.dart';

/// Comprehensive DateTime utilities for QUtils
class QDateTimeUtils {
  /// Common date formats
  static const String iso8601 = 'yyyy-MM-ddTHH:mm:ssZ';
  static const String dateOnly = 'yyyy-MM-dd';
  static const String timeOnly = 'HH:mm:ss';
  static const String dateTime = 'yyyy-MM-dd HH:mm:ss';
  static const String readable = 'MMM dd, yyyy';
  static const String readableWithTime = 'MMM dd, yyyy HH:mm';
  static const String shortDate = 'MM/dd/yyyy';
  static const String longDate = 'EEEE, MMMM dd, yyyy';

  /// Formats a DateTime to a human-readable relative time string
  ///
  /// Returns strings like "just now", "2 minutes ago", "3 hours ago",
  /// "yesterday", "2 days ago", etc.
  ///
  /// [dateTime] The DateTime to format
  /// [locale] Optional locale for formatting (defaults to system locale)
  ///
  /// Example:
  /// ```dart
  /// final now = DateTime.now();
  /// final twoHoursAgo = now.subtract(Duration(hours: 2));
  /// print(QDateTimeUtils.toRelativeTime(twoHoursAgo)); // "2 hours ago"
  /// ```
  static String toRelativeTime(DateTime dateTime, {String? locale}) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 30) {
      return 'just now';
    } else if (difference.inMinutes < 1) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return difference.inMinutes == 1
          ? '1 minute ago'
          : '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return difference.inHours == 1
          ? '1 hour ago'
          : '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      if (difference.inDays == 1) {
        return 'yesterday';
      } else {
        return '${difference.inDays} days ago';
      }
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return months == 1 ? '1 month ago' : '$months months ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return years == 1 ? '1 year ago' : '$years years ago';
    }
  }

  /// Calculate age in years from birth date
  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  /// Check if a year is a leap year
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  /// Get days in a specific month/year
  static int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  /// Format duration to human readable string
  static String formatDuration(Duration duration, {bool verbose = false}) {
    if (duration.inDays > 0) {
      if (verbose) {
        final days = duration.inDays;
        final hours = duration.inHours.remainder(24);
        final minutes = duration.inMinutes.remainder(60);

        final parts = <String>[];
        if (days > 0) parts.add('$days ${days == 1 ? 'day' : 'days'}');
        if (hours > 0) parts.add('$hours ${hours == 1 ? 'hour' : 'hours'}');
        if (minutes > 0)
          parts.add('$minutes ${minutes == 1 ? 'minute' : 'minutes'}');

        return parts.join(' ');
      } else {
        return '${duration.inDays}d ${duration.inHours.remainder(24)}h ${duration.inMinutes.remainder(60)}m';
      }
    } else if (duration.inHours > 0) {
      if (verbose) {
        final hours = duration.inHours;
        final minutes = duration.inMinutes.remainder(60);

        final parts = <String>[];
        if (hours > 0) parts.add('$hours ${hours == 1 ? 'hour' : 'hours'}');
        if (minutes > 0)
          parts.add('$minutes ${minutes == 1 ? 'minute' : 'minutes'}');

        return parts.join(' ');
      } else {
        return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m';
      }
    } else if (duration.inMinutes > 0) {
      if (verbose) {
        final minutes = duration.inMinutes;
        final seconds = duration.inSeconds.remainder(60);

        final parts = <String>[];
        if (minutes > 0)
          parts.add('$minutes ${minutes == 1 ? 'minute' : 'minutes'}');
        if (seconds > 0)
          parts.add('$seconds ${seconds == 1 ? 'second' : 'seconds'}');

        return parts.join(' ');
      } else {
        return '${duration.inMinutes}m ${duration.inSeconds.remainder(60)}s';
      }
    } else {
      if (verbose) {
        final seconds = duration.inSeconds;
        return '$seconds ${seconds == 1 ? 'second' : 'seconds'}';
      } else {
        return '${duration.inSeconds}s';
      }
    }
  }

  /// Parse various date string formats
  static DateTime? parseFlexible(String dateString) {
    final formats = [
      'yyyy-MM-dd HH:mm:ss',
      'yyyy-MM-dd',
      'MM/dd/yyyy',
      'dd/MM/yyyy',
      'yyyy-MM-ddTHH:mm:ssZ',
      'MMM dd, yyyy',
    ];

    for (final format in formats) {
      try {
        return DateFormat(format).parse(dateString);
      } catch (_) {
        // Continue to next format
      }
    }

    return null;
  }

  /// Flexibly parse various date string formats
  static DateTime? tryParse(String dateString, {List<String>? customFormats}) {
    return parseFlexible(dateString);
  }
}
