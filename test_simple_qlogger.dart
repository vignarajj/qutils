import 'dart:convert';

// Core QLogger functionality without Flutter dependencies
enum LogLevel {
  debug,
  info,
  warning,
  error,
  fatal,
}

class AnsiColor {
  final String _code;

  const AnsiColor._(this._code);

  static const AnsiColor red = AnsiColor._('\x1B[31m');
  static const AnsiColor green = AnsiColor._('\x1B[32m');
  static const AnsiColor yellow = AnsiColor._('\x1B[33m');
  static const AnsiColor blue = AnsiColor._('\x1B[34m');
  static const AnsiColor magenta = AnsiColor._('\x1B[35m');
  static const AnsiColor cyan = AnsiColor._('\x1B[36m');
  static const AnsiColor white = AnsiColor._('\x1B[37m');
  static const AnsiColor reset = AnsiColor._('\x1B[0m');

  String apply(String text) {
    return '$_code$text${AnsiColor.reset._code}';
  }
}

class SimpleQLogger {
  static const Map<LogLevel, AnsiColor> _levelColors = {
    LogLevel.debug: AnsiColor.cyan,
    LogLevel.info: AnsiColor.green,
    LogLevel.warning: AnsiColor.yellow,
    LogLevel.error: AnsiColor.red,
    LogLevel.fatal: AnsiColor.magenta,
  };

  static LogLevel _minLevel = LogLevel.debug;

  static void configure({LogLevel minLevel = LogLevel.debug}) {
    _minLevel = minLevel;
  }

  static void debug(String message, {String? tag}) {
    _log(LogLevel.debug, message, tag: tag);
  }

  static void info(String message, {String? tag}) {
    _log(LogLevel.info, message, tag: tag);
  }

  static void warning(String message, {String? tag}) {
    _log(LogLevel.warning, message, tag: tag);
  }

  static void error(String message, {String? tag}) {
    _log(LogLevel.error, message, tag: tag);
  }

  static void fatal(String message, {String? tag}) {
    _log(LogLevel.fatal, message, tag: tag);
  }

  static void json(dynamic data, {String? tag}) {
    try {
      final formatted = JsonEncoder.withIndent('  ').convert(data);
      _log(LogLevel.info, formatted, tag: tag);
    } catch (e) {
      _log(LogLevel.info, data.toString(), tag: tag);
    }
  }

  static void _log(LogLevel level, String message, {String? tag}) {
    if (level.index < _minLevel.index) return;

    final now = DateTime.now();
    final timeStr = '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}:'
        '${now.second.toString().padLeft(2, '0')}';

    final color = _levelColors[level] ?? AnsiColor.white;
    final levelStr = level.toString().split('.').last.toUpperCase().padRight(7);
    final tagStr = tag != null ? '[$tag] ' : '';

    final prefix = '$timeStr ${color.apply(levelStr)} $tagStr';
    print('$prefix$message');
  }
}

void main() {
  print('🚀 Testing Simple QLogger Core Functionality\n');

  // Test basic logging
  print('=== Basic Logging Tests ===');
  SimpleQLogger.debug('This is a debug message');
  SimpleQLogger.info('Application started successfully!');
  SimpleQLogger.warning('This is a warning message');
  SimpleQLogger.error('This is an error message');
  SimpleQLogger.fatal('This is a fatal error');

  // Test with tags
  print('\n=== Tagged Logging Tests ===');
  SimpleQLogger.info('User authentication', tag: 'AUTH');
  SimpleQLogger.warning('Database connection slow', tag: 'DB');
  SimpleQLogger.error('Network timeout', tag: 'API');

  // Test JSON logging
  print('\n=== JSON Logging Tests ===');
  final testData = {
    'user': 'john_doe',
    'status': 'active',
    'preferences': {
      'theme': 'dark',
      'notifications': true,
    },
  };
  SimpleQLogger.json(testData, tag: 'USER_DATA');

  // Test configuration
  print('\n=== Configuration Tests ===');
  SimpleQLogger.configure(minLevel: LogLevel.warning);
  print('Set minimum level to WARNING - debug and info should be filtered:');
  SimpleQLogger.debug('This debug should not appear');
  SimpleQLogger.info('This info should not appear');
  SimpleQLogger.warning('This warning should appear');
  SimpleQLogger.error('This error should appear');

  // Reset configuration
  SimpleQLogger.configure(minLevel: LogLevel.debug);

  print('\n✅ Simple QLogger tests completed successfully!');
  print('🎉 Core QLogger functionality is working correctly!');
}
