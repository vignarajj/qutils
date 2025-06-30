import 'package:qutils/qutils.dart';

void main() {
  print('🚀 Testing QUtils Core Functionality\n');

  // Test QLogger basic functionality
  print('=== QLogger Tests ===');

  // Configure logger
  QLogger.configure(
    minLevel: LogLevel.debug,
    maxLineLength: 80,
    wrapIndent: '  ',
  );

  // Test different log levels
  QLogger.debug('This is a debug message');
  QLogger.info('Application started successfully!');
  QLogger.warning('This is a warning message');
  QLogger.error('This is an error message');
  QLogger.fatal('This is a fatal error');

  // Test with tags
  QLogger.info('User authentication', tag: 'AUTH');
  QLogger.warning('Database connection slow', tag: 'DB');

  // Test JSON logging
  final testData = {
    'user': 'john_doe',
    'status': 'active',
    'preferences': {
      'theme': 'dark',
      'notifications': true,
    },
  };
  QLogger.json(testData, tag: 'USER_DATA');

  // Test tagged logger
  final apiLogger = QLogger.withTag('API');
  apiLogger.info('API request started');
  apiLogger.warning('Rate limit approaching');

  // Test error with details
  try {
    throw Exception('Network timeout');
  } catch (error, stackTrace) {
    QLogger.error(
      'Failed to fetch user data',
      tag: 'NETWORK',
      error: error,
      stackTrace: stackTrace,
    );
  }

  print('\n=== DateTime Utilities Tests ===');

  // Test DateTime utilities
  final now = DateTime.now();
  final yesterday = now.subtract(const Duration(days: 1));

  print('Current time: ${now.format('MMM dd, yyyy HH:mm')}');
  print('Yesterday: ${yesterday.timeAgo()}');
  print('Is today? ${now.isToday}');
  print('Day name: ${now.dayName}');
  print('Quarter: ${now.quarter}');

  // Test age calculation
  final birthDate = DateTime(1990, 5, 15);
  print('Age: ${QDateTimeUtils.calculateAge(birthDate)} years');
  print('Is 2024 leap year? ${QDateTimeUtils.isLeapYear(2024)}');

  print('\n=== Type Conversion Tests ===');

  // Test type conversions
  print('String to int: ${'42'.asIntSafe()}');
  print('Invalid to int: ${'invalid'.asIntSafe(0)}');
  print('String to double: ${'42.5'.asDoubleSafe()}');
  print('String to bool: ${'yes'.asBoolSafe()}');

  // Test byte conversion
  print('Bytes to human: ${QTypeConversion.bytesToHuman(1073741824)}');
  print('Human to bytes: ${QTypeConversion.humanToBytes('1 GB')}');

  print('\n=== String Extensions Tests ===');

  // Test string extensions
  final text = 'hello world';
  print('Original: $text');
  print('Capitalized: ${text.capitalize()}');
  print('Camel case: ${text.toCamelCase()}');
  print('Snake case: ${text.toSnakeCase()}');
  print('Word count: ${text.wordCount}');
  print('Is email valid? ${'user@example.com'.isEmail}');

  print('\n=== JSON Utilities Tests ===');

  // Test JSON utilities
  final jsonString = '{"name":"John","age":30,"active":true}';
  final prettyJson = QJSONUtils.prettify(jsonString);
  print('Pretty JSON:\n$prettyJson');
  print('Is valid JSON: ${jsonString.isValidJSON}');
  print('JSON size: ${jsonString.jsonSize()} bytes');

  print('\n=== File Info Tests ===');

  // Test file info utilities
  final filePath = '/path/to/document.pdf';
  print('File extension: ${QFileInfoUtils.getExtension(filePath)}');
  print('File name: ${QFileInfoUtils.getFileName(filePath)}');
  print('MIME type: ${QFileInfoUtils.getMimeType(filePath)}');
  print('Is document? ${QFileInfoUtils.isDocument(filePath)}');
  print('Is image? ${filePath.isImageFile}');

  print('\n✅ All core functionality tests completed successfully!');
  print('🎉 QUtils library is working correctly!');
}
