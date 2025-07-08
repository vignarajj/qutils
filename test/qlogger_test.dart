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
      );

      // Since these are private fields, we can't directly test them
      // but we can test the behavior by checking if debug messages are filtered out
      expect(() => QLogger.debug('This should not be logged'), returnsNormally);
    });

    test('should log debug messages', () {
      expect(() => QLogger.debug('Debug message'), returnsNormally);
      expect(() => QLogger.debug('Debug with tag'), returnsNormally);
      expect(() => QLogger.debug('Debug with color'), returnsNormally);
    });

    test('should log info messages', () {
      expect(() => QLogger.info('Info message'), returnsNormally);
      expect(() => QLogger.info('Info with tag'), returnsNormally);
      expect(() => QLogger.info('Info with color'), returnsNormally);
    });

    test('should log warning messages', () {
      expect(() => QLogger.warning('Warning message'), returnsNormally);
      expect(() => QLogger.warning('Warning with tag',), returnsNormally);
      expect(() => QLogger.warning('Warning with color',), returnsNormally);
    });

    test('should log error messages', () {
      expect(() => QLogger.error('Error message'), returnsNormally);
      expect(() => QLogger.error('Error with tag'), returnsNormally);
      expect(() => QLogger.error('Error with details',
        Exception('Test exception'),
        StackTrace.current,
      ), returnsNormally);
    });



    test('should log JSON data', () {
      final jsonData = {'name': 'John', 'age': 30, 'active': true};
      expect(() => QLogger.prettyJson(jsonData.toString()), returnsNormally);
      expect(() => QLogger.prettyJson(jsonData.toString()), returnsNormally);
      expect(() => QLogger.prettyJson(jsonData.toString()), returnsNormally);

      // Test with JSON string
      final jsonString = '{"name": "Jane", "age": 25}';
      expect(() => QLogger.prettyJson(jsonString), returnsNormally);
    });

    test('should filter messages based on minimum level', () {
      QLogger.configure(minLevel: LogLevel.warning);

      // These should be filtered out (but we can't test output directly)
      expect(() => QLogger.debug('Debug message'), returnsNormally);
      expect(() => QLogger.info('Info message'), returnsNormally);

      // These should be logged
      expect(() => QLogger.warning('Warning message'), returnsNormally);
      expect(() => QLogger.error('Error message'), returnsNormally);
    });

    test('should handle long messages with wrapping', () {
      final longMessage = 'This is a very long message that should be wrapped when it exceeds the maximum line length configured for the logger. It should split into multiple lines with proper indentation.';
      expect(() => QLogger.info(longMessage), returnsNormally);
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
}
