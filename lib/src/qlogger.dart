import 'dart:convert';
import 'qutils_base.dart';

/// A utility class for colorful, formatted logging in Android Studio and VS Code.
class QLogger {
  /// Log levels with corresponding colors.
  static const Map<LogLevel, AnsiColor> _levelColors = {
    LogLevel.debug: AnsiColor.cyan,
    LogLevel.info: AnsiColor.green,
    LogLevel.warning: AnsiColor.yellow,
    LogLevel.error: AnsiColor.red,
    LogLevel.fatal: AnsiColor.magenta,
  };

  /// The minimum log level that will be shown.
  static LogLevel _minLevel = LogLevel.debug;

  /// Maximum line length before wrapping
  static int _maxLineLength = 120;

  /// Indent for wrapped lines
  static String _wrapIndent = '    ';

  /// Configure the minimum log level that will be displayed.
  static void configure({
    LogLevel minLevel = LogLevel.debug,
    int maxLineLength = 120,
    String wrapIndent = '    ',
  }) {
    _minLevel = minLevel;
    _maxLineLength = maxLineLength;
    _wrapIndent = wrapIndent;
  }

  /// Logs a debug message.
  static void debug(dynamic message, {String? tag, AnsiColor? color}) {
    _log(LogLevel.debug, message, tag: tag, customColor: color);
  }

  /// Logs an info message.
  static void info(dynamic message, {String? tag, AnsiColor? color}) {
    _log(LogLevel.info, message, tag: tag, customColor: color);
  }

  /// Logs a warning message.
  static void warning(dynamic message, {String? tag, AnsiColor? color}) {
    _log(LogLevel.warning, message, tag: tag, customColor: color);
  }

  /// Logs an error message.
  static void error(dynamic message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
    AnsiColor? color,
  }) {
    _log(LogLevel.error, message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
      customColor: color,
    );
  }

  /// Logs a fatal error message.
  static void fatal(dynamic message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
    AnsiColor? color,
  }) {
    _log(LogLevel.fatal, message,
      tag: tag,
      error: error,
      stackTrace: stackTrace,
      customColor: color,
    );
  }

  /// Custom colored logging
  static void custom(dynamic message, {String? tag, required AnsiColor color}) {
    _log(LogLevel.info, message, tag: tag, customColor: color);
  }

  /// JSON prettifies and logs the object.
  static void json(dynamic jsonData, {
    String? tag,
    LogLevel level = LogLevel.debug,
    AnsiColor? color,
  }) {
    String formatted;
    try {
      if (jsonData is String) {
        // Try to parse and re-encode for pretty printing
        final decoded = jsonDecode(jsonData);
        formatted = const JsonEncoder.withIndent('  ').convert(decoded);
      } else {
        formatted = const JsonEncoder.withIndent('  ').convert(jsonData);
      }
    } catch (e) {
      formatted = jsonData.toString();
    }
    _log(level, formatted, tag: tag, customColor: color);
  }

  /// Create a logger with a specific tag
  static QLoggerWithTag withTag(String tag) {
    return QLoggerWithTag(tag);
  }

  /// Format text with proper wrapping for large text blocks
  static List<String> _formatLargeText(String text) {
    if (text.length <= _maxLineLength) {
      return [text];
    }

    final lines = <String>[];
    var currentLine = '';
    final words = text.split(' ');

    for (final word in words) {
      if ((currentLine.length + word.length + 1) <= _maxLineLength) {
        currentLine = currentLine.isEmpty ? word : '$currentLine $word';
      } else {
        if (currentLine.isNotEmpty) {
          lines.add(currentLine);
        }

        // If the word itself is longer than maxLineLength, split it
        if (word.length > _maxLineLength) {
          var remaining = word;
          while (remaining.length > _maxLineLength) {
            lines.add(remaining.substring(0, _maxLineLength));
            remaining = remaining.substring(_maxLineLength);
          }
          currentLine = remaining;
        } else {
          currentLine = word;
        }
      }
    }

    if (currentLine.isNotEmpty) {
      lines.add(currentLine);
    }

    return lines;
  }

  /// Internal logging method.
  static void _log(
    LogLevel level,
    dynamic message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
    AnsiColor? customColor,
  }) {
    if (level.index < _minLevel.index) return;

    final now = DateTime.now();
    final timeStr = '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}:'
        '${now.second.toString().padLeft(2, '0')}.'
        '${now.millisecond.toString().padLeft(3, '0')}';

    final color = customColor ?? _levelColors[level] ?? AnsiColor.white;
    final levelStr = level.toString().split('.').last.toUpperCase().padRight(7);
    final tagStr = tag != null ? '[$tag] ' : '';

    final prefix = '$timeStr ${color.apply(levelStr)} $tagStr';
    final messageStr = message.toString();

    // Handle multi-line messages
    final messageLines = _formatLargeText(messageStr);

    // Print first line with full prefix
    print('$prefix${messageLines.first}');

    // Print additional lines with indent
    for (int i = 1; i < messageLines.length; i++) {
      print('$_wrapIndent${messageLines[i]}');
    }

    // Print error details if provided
    if (error != null) {
      final errorLines = _formatLargeText('Error: $error');
      for (final line in errorLines) {
        print('$_wrapIndent${AnsiColor.red.apply(line)}');
      }
    }

    // Print stack trace if provided
    if (stackTrace != null) {
      final stackLines = stackTrace.toString().split('\n');
      for (final line in stackLines.take(10)) { // Limit stack trace lines
        if (line.isNotEmpty) {
          print('$_wrapIndent${AnsiColor.brightBlack.apply(line)}');
        }
      }
    }
  }
}

/// A logger instance with a predefined tag
class QLoggerWithTag {
  final String tag;

  QLoggerWithTag(this.tag);

  void debug(dynamic message, {AnsiColor? color}) {
    QLogger.debug(message, tag: tag, color: color);
  }

  void info(dynamic message, {AnsiColor? color}) {
    QLogger.info(message, tag: tag, color: color);
  }

  void warning(dynamic message, {AnsiColor? color}) {
    QLogger.warning(message, tag: tag, color: color);
  }

  void error(dynamic message, {
    Object? error,
    StackTrace? stackTrace,
    AnsiColor? color,
  }) {
    QLogger.error(message, tag: tag, error: error, stackTrace: stackTrace, color: color);
  }

  void fatal(dynamic message, {
    Object? error,
    StackTrace? stackTrace,
    AnsiColor? color,
  }) {
    QLogger.fatal(message, tag: tag, error: error, stackTrace: stackTrace, color: color);
  }

  void json(dynamic jsonData, {
    LogLevel level = LogLevel.debug,
    AnsiColor? color,
  }) {
    QLogger.json(jsonData, tag: tag, level: level, color: color);
  }
}