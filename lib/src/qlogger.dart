import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'qutils_base.dart';

/// A utility class for colorful, formatted logging in Android Studio and VS Code.
class QLogger {
  static bool useBoxyFormat = true;
  static LogLevel currentLogLevel = LogLevel.debug;
  static final StringBuffer _logBuffer = StringBuffer();

  /// Adjusted to ensure static access for includeTimestamps and is24HourFormat.
  static bool includeTimestamps = false;
  static bool is24HourFormat = true;

  /// Adjusted to ensure static access for useBoxyFormat.
  static void configure({
    LogLevel minLevel = LogLevel.debug,
    bool boxyFormat = true,
    bool includeTime = false,
    bool is24Hour = true,
  }) {
    useBoxyFormat = boxyFormat;
    currentLogLevel = minLevel;
    includeTimestamps = includeTime;
    is24HourFormat = is24Hour;
  }

  /// Logs an info message in green.
  static void info(String message, [dynamic error, StackTrace? stackTrace]) {
    _log('INFO', message, AnsiColors.green, LogLevel.info, error, stackTrace);
  }

  /// Logs a warning message in yellow.
  static void warning(String message, [dynamic error, StackTrace? stackTrace]) {
    _log(
      'WARNING',
      message,
      AnsiColors.yellow,
      LogLevel.warning,
      error,
      stackTrace,
    );
  }

  /// Logs an error message in red. Handles and formats stack trace if provided.
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    // Handle large error logs
    _handleLargeLogs(
      message,
      (msg) =>
          _log('ERROR', msg, AnsiColors.red, LogLevel.error, error, stackTrace),
    );
  }

  /// Logs a debug message in blue.
  static void debug(String message, [dynamic error, StackTrace? stackTrace]) {
    _log('DEBUG', message, AnsiColors.blue, LogLevel.debug, error, stackTrace);
  }

  /// Logs a JSON string in a pretty format.
  static void prettyJson(String jsonString) {
    try {
      final dynamic jsonObject = json.decode(jsonString);
      final prettyString = const JsonEncoder.withIndent(
        '  ',
      ).convert(jsonObject);
      _handleLargeLogs(
        jsonString,
        (msg) => _log('JSON', prettyString, AnsiColors.cyan, LogLevel.info),
      );
    } catch (e) {
      error('Invalid JSON string provided for pretty logging.');
    }
  }

  /// Retrieves the appropriate emoji for the given log level.
  static String _getEmojiForLevel(LogLevel level) {
    switch (level) {
      case LogLevel.info:
        return '💡'; // Info emoji
      case LogLevel.warning:
        return '⚠️'; // Warning emoji
      case LogLevel.error:
        return '❌'; // Error emoji
      case LogLevel.debug:
        return '🐞'; // Debug emoji
      case LogLevel.fatal:
        return '❌'; // Error emoji
    }
  }

  /// General method to log messages with a specific color and level.
  ///
  /// [level] - Log level (e.g., INFO, WARNING).
  /// [message] - The message to log.
  /// [color] - ANSI color code for the message.
  /// [logLevel] - Log level as `LogLevel` enum.
  /// [error] - Optional error object.
  /// [stackTrace] - Optional stack trace.
  static void _log(
    String level,
    String message,
    String color,
    LogLevel logLevel, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    if (logLevel.index >= currentLogLevel.index) {
      final String timestamp = includeTimestamps ? _getTimestamp() : '';
      final String emoji = _getEmojiForLevel(logLevel);

      // Format stack trace if provided
      String formattedStackTrace = '';
      if (stackTrace != null) {
        formattedStackTrace = _formatStackTrace(stackTrace);
      }

      final String formattedMessage = message.toString();

      // Boxy formatting
      if (useBoxyFormat) {
        _printBoxyLog(
          formattedMessage,
          formattedStackTrace,
          '$emoji $timestamp -  [${logLevel.name.toUpperCase()}]',
          color,
        );
      } else {
        _printFormatted('$color$formattedMessage${AnsiColors.reset}');
      }

      _logToBuffer(level, message, error, stackTrace);
    }
  }

  /// Clears all logged messages from the buffer.
  static void clearLogs() {
    _logBuffer.clear();
  }

  /// Retrieves all logged messages from the buffer.
  static void printAllLogs() {
    final logs = _logBuffer.toString();
    _handleLargeLogs(logs, (chunk) {
      debugPrint(chunk);
    });
  }

  /// Get the current timestamp in the specified format.
  ///
  /// Returns the formatted timestamp string.
  static String _getTimestamp() {
    final DateTime now = DateTime.now();
    final String format = is24HourFormat ? 'HH:mm:ss' : 'hh:mm:ss a';
    return DateFormat(format).format(now);
  }

  /// Prints the formatted log message using debugPrint to avoid the `I/flutter` prefix.
  static void _printFormatted(String message) {
    debugPrint('\x1B[0m$message\x1B[0m'); // Reset colors to avoid bleed
  }

  /// Handles large log messages by splitting them into manageable chunks.
  static void _handleLargeLogs(String message, Function(String) logFunction) {
    const int chunkSize = 800; // Define your chunk size
    if (message.length <= chunkSize) {
      logFunction(message);
    } else {
      int start = 0;
      while (start < message.length) {
        final end = (start + chunkSize < message.length)
            ? start + chunkSize
            : message.length;
        logFunction(message.substring(start, end));
        start += chunkSize;
      }
    }
  }

  /// Prints a formatted boxy log message with color and alignment.
  ///
  /// [message] - The log message to print.
  /// [stackTrace] - The formatted stack trace.
  /// [timestamp] - The timestamp to print.
  /// [color] - The ANSI color code for the box.
  static void _printBoxyLog(
    String message,
    String stackTrace,
    String timestamp,
    String color,
  ) {
    final String header = '$color┌${'─' * 100}┐${AnsiColors.reset}';
    final String footer = '$color└${'─' * 100}┘${AnsiColors.reset}';
    final String separator = '$color├${'─' * 100}┤${AnsiColors.reset}';

    _printFormatted(header);

    // Print timestamp only if it's enabled
    if (includeTimestamps && timestamp.isNotEmpty) {
      _printFormatted('$color│ $timestamp${AnsiColors.reset}');
      _printFormatted(separator);
    }
    // Print message only if it's not empty
    if (message.isNotEmpty) {
      for (var line in message.split('\n')) {
        _printFormatted('$color│ $line${AnsiColors.reset}');
      }
    }
    // Print stack trace if available
    if (stackTrace.isNotEmpty) {
      for (var line in stackTrace.split('\n')) {
        _printFormatted('$color│ $line${AnsiColors.reset}');
      }
      _printFormatted(separator);
    }

    _printFormatted(footer);
  }

  /// Formats the stack trace to a readable string format.
  ///
  /// [stackTrace] - The stack trace to format.
  /// Returns a formatted string representation of the stack trace.
  static String _formatStackTrace(StackTrace? stackTrace) {
    if (stackTrace == null) return '';
    final frames = stackTrace
        .toString()
        .split('\n')
        .take(5); // Take the top 5 frames for compactness
    return frames
        .map((frame) => frame.trim())
        .join('\n'); // Aligning stack trace within the box
  }

  /// Logs a message with the specified level to the buffer.
  ///
  /// [level] - The level of the log (e.g., DEBUG, INFO).
  /// [message] - The message to log.
  /// [error] - Optional error object.
  /// [stackTrace] - Optional stack trace.
  static void _logToBuffer(
    String level,
    String message, [
    dynamic error,
    StackTrace? stackTrace,
  ]) {
    _handleLargeLogs(
      message,
      (msg) => _logBuffer.writeln('${DateTime.now()}: $level - $msg'),
    );
    if (error != null) {
      _logBuffer.writeln('Error: $error');
    }
    if (stackTrace != null) {
      _logBuffer.writeln('StackTrace: ${_formatStackTrace(stackTrace)}');
    }
  }
}

/// ANSI color codes for colorful console output.
class AnsiColors {
  static const String reset = '\x1B[0m'; // Reset to default
  static const String red = '\x1B[31m'; // Red text
  static const String green = '\x1B[32m'; // Green text
  static const String yellow = '\x1B[33m'; // Yellow text
  static const String blue = '\x1B[34m'; // Blue text
  static const String magenta = '\x1B[35m'; // Magenta text
  static const String cyan = '\x1B[36m'; // Cyan text
  static const String white = '\x1B[37m'; // White text
}
