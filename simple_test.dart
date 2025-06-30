import 'lib/qutils.dart';

void main() {
  print('🚀 QUtils Package Test\n');
  
  // Test DateTime utilities
  print('📅 DateTime Utilities:');
  final now = DateTime.now();
  final twoHoursAgo = now.subtract(Duration(hours: 2));
  
  print('Current time: ${now.toReadableWithTime()}');
  print('Two hours ago: ${twoHoursAgo.timeAgo()}');
  print('Is today? ${now.isToday}');
  print('Day of week: ${now.dayName}');
  print('Age calculation: ${QDateTimeUtils.calculateAge(DateTime(1990, 5, 15))} years');
  print('Is leap year? ${QDateTimeUtils.isLeapYear(2024)}');
  print('');
  
  // Test Type Conversion
  print('🔄 Type Conversion:');
  print('String to int: ${'42'.asIntSafe()}');
  print('String to double: ${'42.5'.asDoubleSafe()}');
  print('String to bool: ${'yes'.asBoolSafe()}');
  print('Invalid conversion: ${'invalid'.asIntSafe(0)}');
  print('Bytes to human: ${QTypeConversion.bytesToHuman(1073741824)}');
  print('Human to bytes: ${QTypeConversion.humanToBytes('1 GB')}');
  print('');
  
  // Test File Info utilities
  print('📁 File Info Utilities:');
  final filePath = '/path/to/document.pdf';
  print('File extension: ${QFileInfoUtils.getExtension(filePath)}');
  print('File name: ${QFileInfoUtils.getFileName(filePath)}');
  print('Base name: ${QFileInfoUtils.getBaseName(filePath)}');
  print('MIME type: ${QFileInfoUtils.getMimeType(filePath)}');
  print('Is document? ${QFileInfoUtils.isDocument(filePath)}');
  print('Is image? ${filePath.isImageFile}');
  print('');
  
  // Test JSON utilities
  print('📄 JSON Utilities:');
  final jsonString = '{"name":"John","age":30,"city":"NYC"}';
  final prettyJson = jsonString.jsonPrettify();
  print('Original: $jsonString');
  print('Prettified: ${prettyJson?.replaceAll('\n', ' ')}');
  print('Is valid JSON: ${jsonString.isValidJSON}');
  print('JSON size: ${jsonString.jsonSize()} bytes');
  print('Key count: ${jsonString.jsonKeyCount()}');
  
  final complexJson = '{"user":{"profile":{"name":"Alice"}}}';
  print('Extract nested: ${complexJson.jsonExtract('user.profile.name')}');
  print('');
  
  // Test QR Code utilities
  print('📱 QR Code Utilities:');
  final qrData = 'https://flutter.dev';
  final validation = QQRCodeUtils.validateQRData(qrData);
  print('QR data: $qrData');
  print('Is valid: ${validation.isValid}');
  print('Optimal version: ${QQRCodeUtils.getOptimalVersion(qrData)}');
  
  // WiFi QR example
  final wifiQR = QQRCodeUtils.createWiFiQR('MyNetwork', 'password123');
  print('WiFi QR data: ${wifiQR.substring(0, 30)}...');
  print('');
  
  // Test Color utilities
  print('🎨 Color Utilities:');
  print('Total colors: ${QColors.allColors.length}');
  print('Pastel colors: ${QColors.pastelColors.length}');
  print('Brand colors: ${QColors.brandColors.length}');
  print('Random color: ${QColors.random().toHex()}');
  print('Hot pink hex: ${QColors.hotPink.toHex()}');
  print('Hot pink RGB: ${QColors.hotPink.toRgbList()}');
  
  // Color manipulation
  final baseColor = QColors.electricBlue;
  print('Base color: ${baseColor.toHex()}');
  print('Lighter: ${baseColor.lighten(0.2).toHex()}');
  print('Darker: ${baseColor.darken(0.2).toHex()}');
  print('Complement: ${baseColor.complement().toHex()}');
  print('Is dark: ${baseColor.isDark}');
  print('Contrasting text: ${baseColor.contrastingTextColor().toHex()}');
  print('');
  
  // Test String extensions
  print('📝 String Extensions:');
  final text = 'hello world';
  print('Original: $text');
  print('Capitalized: ${text.capitalize()}');
  print('Title case: ${text.capitalizeWords()}');
  print('Camel case: ${text.toCamelCase()}');
  print('Snake case: ${text.toSnakeCase()}');
  print('Kebab case: ${text.toKebabCase()}');
  print('Word count: ${text.wordCount}');
  print('Is email: ${'user@example.com'.isEmail}');
  print('Is URL: ${'https://flutter.dev'.isURL}');
  print('');
  
  // Test DateTime extensions
  print('📅 DateTime Extensions:');
  final sampleDate = DateTime(2023, 12, 25, 15, 30, 45);
  print('Sample date: $sampleDate');
  print('Formatted: ${sampleDate.format('MMM dd, yyyy HH:mm')}');
  print('Date only: ${sampleDate.toDateString()}');
  print('Time only: ${sampleDate.toTimeString()}');
  print('Quarter: ${sampleDate.quarter}');
  print('Week of year: ${sampleDate.weekOfYear}');
  print('Add 2 months: ${sampleDate.addMonths(2).toDateString()}');
  print('Start of week: ${sampleDate.startOfWeek.toDateString()}');
  print('');
  
  print('✅ All QUtils features tested successfully!');
} 