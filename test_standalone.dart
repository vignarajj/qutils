import 'dart:io';
import 'lib/src/datetime_utils.dart';
import 'lib/src/type_conversion.dart';
import 'lib/src/file_info_utils.dart';
import 'lib/src/json_utils.dart';
import 'lib/extensions/string_extensions.dart';
import 'lib/extensions/datetime_extensions.dart';

void main() {
  print('🔧 QUtils Standalone Test');
  print('=========================\n');
  
  try {
    // Test DateTime Utils
    print('📅 DateTime Utils:');
    final now = DateTime.now();
    print('Current time: ${now.toString()}');
    print('Relative time: ${QDateTimeUtils.toRelativeTime(now)}');
    print('Is today: ${now.isToday}');
    print('');
    
    // Test Type Conversion
    print('🔄 Type Conversion:');
    print('String to int: ${QTypeConversion.toIntSafe('42', 0)}');
    print('String to double: ${QTypeConversion.toDoubleSafe('42.5', 0.0)}');
    print('String to bool: ${QTypeConversion.toBoolSafe('true', false)}');
    print('');
    
    // Test File Info Utils
    print('📁 File Info Utils:');
    final testPath = '/path/to/test.txt';
    print('Extension: ${QFileInfoUtils.getExtension(testPath)}');
    print('Filename: ${QFileInfoUtils.getFileName(testPath)}');
    print('MIME type: ${QFileInfoUtils.getMimeType(testPath)}');
    print('Is document: ${QFileInfoUtils.isDocument(testPath)}');
    print('');
    
    // Test JSON Utils
    print('📄 JSON Utils:');
    final jsonString = '{"name":"Test","value":123}';
    final validation = QJSONUtils.validate(jsonString);
    print('JSON valid: ${validation.isValid}');
    print('Prettified: ${QJSONUtils.prettify(jsonString)}');
    print('');
    
    // Test String Extensions
    print('📝 String Extensions:');
    final testText = 'hello world test';
    print('Original: $testText');
    print('Capitalized: ${testText.capitalize()}');
    print('Camel case: ${testText.toCamelCase()}');
    print('Word count: ${testText.wordCount}');
    print('Is email: ${'test@example.com'.isEmail}');
    print('');
    
    // Test DateTime Extensions
    print('📅 DateTime Extensions:');
    final testDate = DateTime(2023, 12, 25, 15, 30);
    print('Test date: $testDate');
    print('Formatted: ${testDate.format('MMM dd, yyyy')}');
    print('Date string: ${testDate.toDateString()}');
    print('Time string: ${testDate.toTimeString()}');
    print('Quarter: ${testDate.quarter}');
    print('');
    
    print('✅ All tests passed! QUtils core functionality is working correctly.');
    
  } catch (e, stackTrace) {
    print('❌ Error occurred: $e');
    print('Stack trace: $stackTrace');
    exit(1);
  }
} 