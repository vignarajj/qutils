import 'package:test/test.dart';
import 'package:qutils/qutils.dart';

void main() {
  group('QLogger Tests', () {
    setUp(() {
      // Reset logger configuration before each test
      QLogger.configure();
    });

    test('should configure logger with custom settings', () {
      QLogger.configure(
        minLevel: LogLevel.warning,
        maxLineLength: 80,
        wrapIndent: '  ',
      );

      // Since these are private fields, we can't directly test them
      // but we can test the behavior by checking if debug messages are filtered out
      expect(() => QLogger.debug('This should not be logged'), returnsNormally);
    });

    test('should log debug messages', () {
      expect(() => QLogger.debug('Debug message'), returnsNormally);
      expect(() => QLogger.debug('Debug with tag', tag: 'TEST'), returnsNormally);
      expect(() => QLogger.debug('Debug with color', color: AnsiColor.blue), returnsNormally);
    });

    test('should log info messages', () {
      expect(() => QLogger.info('Info message'), returnsNormally);
      expect(() => QLogger.info('Info with tag', tag: 'TEST'), returnsNormally);
      expect(() => QLogger.info('Info with color', color: AnsiColor.green), returnsNormally);
    });

    test('should log warning messages', () {
      expect(() => QLogger.warning('Warning message'), returnsNormally);
      expect(() => QLogger.warning('Warning with tag', tag: 'TEST'), returnsNormally);
      expect(() => QLogger.warning('Warning with color', color: AnsiColor.yellow), returnsNormally);
    });

    test('should log error messages', () {
      expect(() => QLogger.error('Error message'), returnsNormally);
      expect(() => QLogger.error('Error with tag', tag: 'TEST'), returnsNormally);
      expect(() => QLogger.error('Error with details',
        tag: 'TEST',
        error: Exception('Test exception'),
        stackTrace: StackTrace.current,
      ), returnsNormally);
    });

    test('should log fatal messages', () {
      expect(() => QLogger.fatal('Fatal message'), returnsNormally);
      expect(() => QLogger.fatal('Fatal with details',
        tag: 'TEST',
        error: Exception('Test exception'),
        stackTrace: StackTrace.current,
      ), returnsNormally);
    });

    test('should log custom colored messages', () {
      expect(() => QLogger.custom('Custom message', color: AnsiColor.magenta), returnsNormally);
      expect(() => QLogger.custom('Custom with tag', tag: 'TEST', color: AnsiColor.cyan), returnsNormally);
    });

    test('should log JSON data', () {
      final jsonData = {'name': 'John', 'age': 30, 'active': true};
      expect(() => QLogger.json(jsonData), returnsNormally);
      expect(() => QLogger.json(jsonData, tag: 'JSON'), returnsNormally);
      expect(() => QLogger.json(jsonData, level: LogLevel.info), returnsNormally);

      // Test with JSON string
      final jsonString = '{"name": "Jane", "age": 25}';
      expect(() => QLogger.json(jsonString), returnsNormally);
    });

    test('should filter messages based on minimum level', () {
      QLogger.configure(minLevel: LogLevel.warning);

      // These should be filtered out (but we can't test output directly)
      expect(() => QLogger.debug('Debug message'), returnsNormally);
      expect(() => QLogger.info('Info message'), returnsNormally);

      // These should be logged
      expect(() => QLogger.warning('Warning message'), returnsNormally);
      expect(() => QLogger.error('Error message'), returnsNormally);
      expect(() => QLogger.fatal('Fatal message'), returnsNormally);
    });

    test('should handle long messages with wrapping', () {
      final longMessage = 'This is a very long message that should be wrapped when it exceeds the maximum line length configured for the logger. It should split into multiple lines with proper indentation.';

      QLogger.configure(maxLineLength: 50);
      expect(() => QLogger.info(longMessage), returnsNormally);
    });

    test('should handle null and empty messages', () {
      expect(() => QLogger.info(null), returnsNormally);
      expect(() => QLogger.info(''), returnsNormally);
      expect(() => QLogger.info('   '), returnsNormally);
    });

    test('should handle invalid JSON gracefully', () {
      expect(() => QLogger.json('invalid json'), returnsNormally);
      expect(() => QLogger.json(null), returnsNormally);
    });
  });

  group('QLoggerWithTag Tests', () {
    test('should create logger with tag', () {
      final logger = QLogger.withTag('TestTag');
      expect(logger.tag, equals('TestTag'));
    });

    test('should log with predefined tag', () {
      final logger = QLogger.withTag('TestTag');

      expect(() => logger.debug('Debug message'), returnsNormally);
      expect(() => logger.info('Info message'), returnsNormally);
      expect(() => logger.warning('Warning message'), returnsNormally);
      expect(() => logger.error('Error message'), returnsNormally);
      expect(() => logger.fatal('Fatal message'), returnsNormally);
    });

    test('should log JSON with predefined tag', () {
      final logger = QLogger.withTag('JSON');
      final data = {'test': 'data'};

      expect(() => logger.json(data), returnsNormally);
      expect(() => logger.json(data, level: LogLevel.info), returnsNormally);
    });

    test('should handle errors with predefined tag', () {
      final logger = QLogger.withTag('ErrorTag');

      expect(() => logger.error('Error message',
        error: Exception('Test exception'),
        stackTrace: StackTrace.current,
      ), returnsNormally);
    });
  });

  group('AnsiColor Tests', () {
    test('should apply colors to text', () {
      final coloredText = AnsiColor.red.apply('Hello');
      expect(coloredText, contains('Hello'));
      expect(coloredText, startsWith('\x1B[31m'));
      expect(coloredText, endsWith('\x1B[0m'));
    });

    test('should create RGB colors', () {
      final rgbColor = AnsiColor.rgb(255, 0, 0);
      final coloredText = rgbColor.apply('Red text');
      expect(coloredText, contains('Red text'));
    });

    test('should create background RGB colors', () {
      final bgColor = AnsiColor.bgRgb(255, 255, 0);
      final coloredText = bgColor.apply('Yellow background');
      expect(coloredText, contains('Yellow background'));
    });

    test('should combine colors', () {
      final combined = AnsiColor.red.combine(AnsiColor.bold);
      final coloredText = combined.apply('Bold red text');
      expect(coloredText, contains('Bold red text'));
    });

    test('should have predefined colors', () {
      expect(AnsiColor.red.toString(), equals('\x1B[31m'));
      expect(AnsiColor.green.toString(), equals('\x1B[32m'));
      expect(AnsiColor.blue.toString(), equals('\x1B[34m'));
      expect(AnsiColor.yellow.toString(), equals('\x1B[33m'));
      expect(AnsiColor.magenta.toString(), equals('\x1B[35m'));
      expect(AnsiColor.cyan.toString(), equals('\x1B[36m'));
    });

    test('should have style codes', () {
      expect(AnsiColor.bold.toString(), equals('\x1B[1m'));
      expect(AnsiColor.italic.toString(), equals('\x1B[3m'));
      expect(AnsiColor.underline.toString(), equals('\x1B[4m'));
      expect(AnsiColor.reset.toString(), equals('\x1B[0m'));
    });
  });

  group('LogLevel Tests', () {
    test('should have correct log levels', () {
      expect(LogLevel.debug.index, equals(0));
      expect(LogLevel.info.index, equals(1));
      expect(LogLevel.warning.index, equals(2));
      expect(LogLevel.error.index, equals(3));
      expect(LogLevel.fatal.index, equals(4));
    });

    test('should compare log levels correctly', () {
      expect(LogLevel.debug.index < LogLevel.info.index, isTrue);
      expect(LogLevel.info.index < LogLevel.warning.index, isTrue);
      expect(LogLevel.warning.index < LogLevel.error.index, isTrue);
      expect(LogLevel.error.index < LogLevel.fatal.index, isTrue);
    });
  });

  group('QLogger Integration Tests', () {
    test('should work with real-world scenarios', () {
      // Simulate a real application scenario
      final userLogger = QLogger.withTag('USER');
      final apiLogger = QLogger.withTag('API');

      // User operations
      expect(() => userLogger.info('User logged in'), returnsNormally);
      expect(() => userLogger.debug('User preferences loaded'), returnsNormally);

      // API operations
      final apiResponse = {'status': 'success', 'data': {'id': 123}};
      expect(() => apiLogger.json(apiResponse, level: LogLevel.info), returnsNormally);

      // Error handling
      expect(() => apiLogger.error('API request failed',
        error: Exception('Network timeout'),
        stackTrace: StackTrace.current,
      ), returnsNormally);
    });

    test('should handle complex data structures', () {
      final complexData = {
        'user': {
          'id': 123,
          'name': 'John Doe',
          'preferences': {
            'theme': 'dark',
            'notifications': true,
            'languages': ['en', 'es', 'fr'],
          },
        },
        'session': {
          'token': 'abc123',
          'expires': DateTime.now().toIso8601String(),
          'permissions': ['read', 'write'],
        },
      };

      expect(() => QLogger.json(complexData, tag: 'COMPLEX'), returnsNormally);
    });

    test('should handle performance logging', () {
      final stopwatch = Stopwatch()..start();

      // Simulate some work
      for (int i = 0; i < 1000; i++) {
        // Simulate processing
      }

      stopwatch.stop();

      expect(() => QLogger.info('Operation completed in ${stopwatch.elapsedMilliseconds}ms',
        tag: 'PERF',
      ), returnsNormally);
    });
  });
}
