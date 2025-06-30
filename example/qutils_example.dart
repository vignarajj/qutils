import 'package:flutter/material.dart';
import 'package:qutils/qutils.dart';

void main() {
  runApp(QUtilsExampleApp());
}

class QUtilsExampleApp extends StatelessWidget {
  const QUtilsExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QUtils Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: QUtilsExampleScreen(),
    );
  }
}

class QUtilsExampleScreen extends StatefulWidget {
  const QUtilsExampleScreen({super.key});

  @override
  QUtilsExampleScreenState createState() => QUtilsExampleScreenState();
}

class QUtilsExampleScreenState extends State<QUtilsExampleScreen> {
  String _results = '';

  @override
  void initState() {
    super.initState();
    _runExamples();
  }

  void _runExamples() {
    final buffer = StringBuffer();
    
    buffer.writeln('=== QUtils Comprehensive Example ===\n');
    
    // ======================== DATETIME UTILITIES ========================
    buffer.writeln('🕒 DATETIME UTILITIES:');
    final now = DateTime.now();
    final twoHoursAgo = now.subtract(Duration(hours: 2));
    
    buffer.writeln('Current time: ${now.toReadableWithTime()}');
    buffer.writeln('Two hours ago: ${twoHoursAgo.timeAgo()}');
    buffer.writeln('Is today? ${now.isToday}');
    buffer.writeln('Day of week: ${now.dayName}');
    buffer.writeln('Start of day: ${now.startOfDay.toTimeString()}');
    buffer.writeln('Age calculation: ${QDateTimeUtils.calculateAge(DateTime(1990, 5, 15))} years');
    buffer.writeln('Is leap year? ${QDateTimeUtils.isLeapYear(2024)}');
    buffer.writeln('Duration format: ${Duration(hours: 2, minutes: 30).humanReadable}');
    buffer.writeln();
    
    // ======================== TYPE CONVERSION ========================
    buffer.writeln('🔄 TYPE CONVERSION:');
    buffer.writeln('String to int: ${'42'.asIntSafe()}');
    buffer.writeln('String to double: ${'42.5'.asDoubleSafe()}');
    buffer.writeln('String to bool: ${'yes'.asBoolSafe()}');
    buffer.writeln('Invalid conversion: ${'invalid'.asIntSafe(0)}');
    buffer.writeln('Bytes to human: ${QTypeConversion.bytesToHuman(1073741824)}');
    buffer.writeln('Human to bytes: ${QTypeConversion.humanToBytes('1 GB')}');
    buffer.writeln();
    
    // ======================== FILE INFO UTILITIES ========================
    buffer.writeln('📁 FILE INFO UTILITIES:');
    final filePath = '/path/to/document.pdf';
    buffer.writeln('File extension: ${QFileInfoUtils.getExtension(filePath)}');
    buffer.writeln('File name: ${QFileInfoUtils.getFileName(filePath)}');
    buffer.writeln('Base name: ${QFileInfoUtils.getBaseName(filePath)}');
    buffer.writeln('MIME type: ${QFileInfoUtils.getMimeType(filePath)}');
    buffer.writeln('Is document? ${QFileInfoUtils.isDocument(filePath)}');
    buffer.writeln('Is image? ${filePath.isImageFile}'); // Extension method
    buffer.writeln();
    
    // ======================== JSON UTILITIES ========================
    buffer.writeln('📄 JSON UTILITIES:');
    final jsonString = '{"name":"John","age":30,"city":"NYC"}';
    final prettyJson = jsonString.jsonPrettify();
    buffer.writeln('Original: $jsonString');
    buffer.writeln('Prettified: ${prettyJson?.replaceAll('\n', ' ')}');
    buffer.writeln('Is valid JSON: ${jsonString.isValidJSON}');
    buffer.writeln('JSON size: ${jsonString.jsonSize()} bytes');
    buffer.writeln('Key count: ${jsonString.jsonKeyCount()}');
    
    final complexJson = '{"user":{"profile":{"name":"Alice"}}}';
    buffer.writeln('Extract nested: ${complexJson.jsonExtract('user.profile.name')}');
    buffer.writeln();
    
    // ======================== QR CODE UTILITIES ========================
    buffer.writeln('📱 QR CODE UTILITIES:');
    final qrData = 'https://flutter.dev';
    final validation = QQRCodeUtils.validateQRData(qrData);
    buffer.writeln('QR data: $qrData');
    buffer.writeln('Is valid: ${validation.isValid}');
    buffer.writeln('Optimal version: ${QQRCodeUtils.getOptimalVersion(qrData)}');
    
    // WiFi QR example
    final wifiQR = QQRCodeUtils.createWiFiQR('MyNetwork', 'password123');
    buffer.writeln('WiFi QR data: ${wifiQR.substring(0, 30)}...');
    buffer.writeln();
    
    // ======================== COLOR UTILITIES ========================
    buffer.writeln('🎨 COLOR UTILITIES:');
    buffer.writeln('Total colors: ${QColors.allColors.length}');
    buffer.writeln('Pastel colors: ${QColors.pastelColors.length}');
    buffer.writeln('Brand colors: ${QColors.brandColors.length}');
    buffer.writeln('Random color: ${QColors.random().toHex()}');
    buffer.writeln('Hot pink hex: ${QColors.hotPink.toHex()}');
    buffer.writeln('Hot pink RGB: ${QColors.hotPink.toRgbList()}');
    
    // Color manipulation
    final baseColor = QColors.electricBlue;
    buffer.writeln('Base color: ${baseColor.toHex()}');
    buffer.writeln('Lighter: ${baseColor.lighten(0.2).toHex()}');
    buffer.writeln('Darker: ${baseColor.darken(0.2).toHex()}');
    buffer.writeln('Complement: ${baseColor.complement().toHex()}');
    buffer.writeln('Is dark: ${baseColor.isDark}');
    buffer.writeln('Contrasting text: ${baseColor.contrastingTextColor().toHex()}');
    buffer.writeln();
    
    // ======================== STRING EXTENSIONS ========================
    buffer.writeln('📝 STRING EXTENSIONS:');
    final text = 'hello world';
    buffer.writeln('Original: $text');
    buffer.writeln('Capitalized: ${text.capitalize()}');
    buffer.writeln('Title case: ${text.capitalizeWords()}');
    buffer.writeln('Camel case: ${text.toCamelCase()}');
    buffer.writeln('Snake case: ${text.toSnakeCase()}');
    buffer.writeln('Kebab case: ${text.toKebabCase()}');
    buffer.writeln('Word count: ${text.wordCount}');
    buffer.writeln('Is email: ${'user@example.com'.isEmail}');
    buffer.writeln('Is URL: ${'https://flutter.dev'.isURL}');
    buffer.writeln();
    
    // ======================== DATETIME EXTENSIONS ========================
    buffer.writeln('📅 DATETIME EXTENSIONS:');
    final sampleDate = DateTime(2023, 12, 25, 15, 30, 45);
    buffer.writeln('Sample date: $sampleDate');
    buffer.writeln('Formatted: ${sampleDate.format('MMM dd, yyyy HH:mm')}');
    buffer.writeln('Date only: ${sampleDate.toDateString()}');
    buffer.writeln('Time only: ${sampleDate.toTimeString()}');
    buffer.writeln('Quarter: ${sampleDate.quarter}');
    buffer.writeln('Week of year: ${sampleDate.weekOfYear}');
    buffer.writeln('Add 2 months: ${sampleDate.addMonths(2).toDateString()}');
    buffer.writeln('Start of week: ${sampleDate.startOfWeek.toDateString()}');
    buffer.writeln();
    
    // ======================== SUMMARY ========================
    buffer.writeln('✅ ALL QUTILS FEATURES DEMONSTRATED!');
    buffer.writeln('Features include:');
    buffer.writeln('• DateTime utilities with 25+ methods');
    buffer.writeln('• Safe type conversion with fallbacks');
    buffer.writeln('• File info extraction with MIME types');
    buffer.writeln('• QR code generation with styling');
    buffer.writeln('• JSON prettification and validation');
    buffer.writeln('• 100+ curated colors with utilities');
    buffer.writeln('• Comprehensive extensions on core types');
    
    setState(() {
      _results = buffer.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QUtils Example'),
        backgroundColor: QColors.electricBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // QR Code Demo
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'QR Code Demo',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 16),
                QQRCodeUtils.createQRWidget(
                  'https://flutter.dev',
                  size: 150,
                  backgroundColor: QColors.pastelBlue.lighten(0.3),
                  foregroundColor: QColors.darkBlue,
                ),
                SizedBox(height: 8),
                Text('https://flutter.dev'),
              ],
            ),
          ),
          
          Divider(),
          
          // Color Palette Demo
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Color Palette Demo',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: QColors.vibrantColors.map((color) => Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
          
          Divider(),
          
          // Results
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Console Output:',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Text(
                          _results,
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _runExamples,
        backgroundColor: QColors.warmOrange,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
