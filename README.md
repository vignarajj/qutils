<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

# 🛠️ QUtils

> **A comprehensive utility package for Dart & Flutter developers**

[![Pub Version](https://img.shields.io/pub/v/qutils.svg)](https://pub.dev/packages/qutils)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-Compatible-blue.svg)](https://flutter.dev)

QUtils is your **all-in-one toolkit** that supercharges your Dart and Flutter development with essential utilities, extensions, and helpers. Stop writing boilerplate code and start building amazing apps! 🚀

---

## 📱 Platform Support

| Android | iOS | macOS | Web | Linux | Windows |
|:-------:|:---:|:-----:|:---:|:-----:|:-------:|
|    ✅    |  ✅  |   ✅   |  ✅  |   ✅   |    ✅    |

QUtils is designed to work seamlessly across all platforms supported by Flutter!

---

## ✨ Features

### 🌍 **Countries Data - Complete World Database**
- **195+ countries** with comprehensive data
- **ISO 2-letter and 3-letter codes** (US, USA)
- **International phone codes** (+1, +44, +91)
- **Flag emojis** for visual representation 🇺🇸 🇬🇧 🇮🇳
- **Smart search and filtering** capabilities
- **Lookup functions** by name, code, or phone number
- **Utility lists** for dropdowns and selections

### 🎨 **QLogger - Advanced Colorful Logging**
- **Colorful console output** with ANSI colors for better readability
- **Multiple log levels**: Debug, Info, Warning, Error, Fatal
- **Custom tags** and **colored output** for organized logging
- **JSON prettification** and logging support
- **Text wrapping** for long messages with proper indentation
- **Tagged loggers** for component-specific logging
- **Configurable** minimum log levels and formatting options

### 🕒 **DateTime Utilities**
- **25+ powerful methods** for date manipulation and formatting
- Relative time calculations (`2 hours ago`, `in 3 days`)
- Date validation and age calculation
- Start/end of day, week, month helpers
- Leap year detection and more!

### 🔄 **Type Conversion**
- **Safe type conversions** with fallback values
- Human-readable byte formatting (`1.5 GB`, `256 MB`)
- String to number conversions with validation
- Null-safe operations throughout

### 📁 **File Info Utilities**
- **File type detection** by extension (images, videos, documents)
- MIME type detection and file categorization
- File size calculations with human-readable formats
- Path manipulation and validation
- File existence checks and metadata extraction

### 🎨 **Color Collections & Extensions**
- **100+ curated colors** organized in collections
- Vibrant, pastel, brand-inspired, and nature colors
- Color manipulation (lighten, darken, saturate)
- Color scheme generation (complementary, triadic, analogous)
- Hex conversion and RGB utilities

### 🔗 **QR Code Utilities**
- QR code generation with customizable styling
- WiFi, URL, email, contact, and phone QR codes
- QR code validation and optimization
- Embedded images and custom designs
- Multiple error correction levels

### 📄 **JSON Utilities**
- JSON prettification and minification
- Safe parsing with fallback values
- JSON validation and error reporting
- Dot notation value extraction
- Size calculation and key counting

### 🔤 **String Extensions**
- **30+ string manipulation methods**
- Case conversions (camelCase, snake_case, kebab-case)
- Validation (email, URL, phone number)
- Safe type conversions from strings
- Text formatting and utilities

### ⏰ **DateTime Extensions**
- Intuitive date formatting and manipulation
- Relative time calculations
- Date arithmetic and comparisons
- Quarter and week calculations
- Human-readable duration formatting

### 📂 **File Extensions**
- File type detection and categorization
- Path manipulation utilities
- Size and metadata extraction
- File validation helpers

---

## 🚀 Quick Start

### Installation

Add QUtils to your `pubspec.yaml`:

```yaml
dependencies:
  qutils: ^1.0.0
```

Then run:

```bash
flutter pub get
```

### Basic Usage

```dart
import 'package:qutils/qutils.dart';

void main() {
  // 🌍 Countries Data
  print('Total countries: ${QCountries.all.length}'); // 195+
  
  // Find by ISO code
  final usa = QCountries.byIso2('US');
  print('${usa?.name} ${usa?.emoji} ${usa?.phoneCode}'); // "United States 🇺🇸 +1"
  
  // Search countries
  final results = QCountries.search('United');
  print('Found ${results.length} countries'); // United States, United Kingdom, etc.
  
  // Get all phone codes for a dropdown
  final phoneCodes = QCountries.phoneCodes;
  print('Available codes: ${phoneCodes.length}'); // All unique phone codes
  
  // 🎨 QLogger - Colorful Logging
  QLogger.info('Application started successfully!');
  QLogger.warning('This is a warning message', tag: 'AUTH');
  QLogger.error('Something went wrong!', 
    tag: 'DATABASE',
    error: Exception('Connection failed'),
    stackTrace: StackTrace.current,
  );
  
  // JSON logging
  QLogger.json({'user': 'john', 'status': 'active'}, tag: 'API');
  
  // Tagged logger for specific components
  final apiLogger = QLogger.withTag('API');
  apiLogger.info('API request completed');
  
  // 🕒 DateTime Utilities
  final now = DateTime.now();
  print(now.timeAgo()); // "just now"
  print(now.toReadableWithTime()); // "Dec 25, 2023 10:30"
  print(now.isToday); // true
  print(now.quarter); // 4
  
  // 🔄 Type Conversion
  print('42'.asIntSafe()); // 42
  print('invalid'.asIntSafe(0)); // 0
  print(QTypeConversion.bytesToHuman(1073741824)); // "1.00 GB"
  
  // 🎨 Colors
  final color = QColors.electricBlue;
  print(color.toHex()); // "#0080FF"
  print(color.lighten(0.2).toHex()); // Lighter shade
  
  // 📁 File Utilities
  final filePath = '/path/to/document.pdf';
  print(filePath.isDocumentFile); // true
  print(filePath.fileExtension); // "pdf"
  print(QFileInfoUtils.getMimeType(filePath)); // "application/pdf"
}
```

---

## 📖 Detailed Documentation

### 🌍 Countries Data

QCountries provides comprehensive access to world country data with powerful lookup and search capabilities.

#### Access All Countries

```dart
// Get all countries (195+ countries)
final allCountries = QCountries.all;
print('Total countries: ${allCountries.length}');

// Access country properties
final firstCountry = allCountries.first;
print('Name: ${firstCountry.name}');        // "Afghanistan"
print('ISO2: ${firstCountry.iso2}');        // "AF"
print('ISO3: ${firstCountry.iso3}');        // "AFG"
print('Phone: ${firstCountry.phoneCode}');  // "+93"
print('Flag: ${firstCountry.emoji}');       // "🇦🇫"
```

#### Lookup Countries

```dart
// Lookup by ISO 2-letter code (case insensitive)
final usa = QCountries.byIso2('US');
final uk = QCountries.byIso2('gb'); // case insensitive
print('USA: ${usa?.name} ${usa?.emoji}'); // "United States 🇺🇸"

// Lookup by ISO 3-letter code
final canada = QCountries.byIso3('CAN');
print('Canada: ${canada?.name} ${canada?.emoji}'); // "Canada 🇨🇦"

// Lookup by phone code
final india = QCountries.byPhoneCode('+91');
print('India: ${india?.name} ${india?.emoji}'); // "India 🇮🇳"

// Lookup by name (exact match)
final japan = QCountries.byName('Japan');
print('Japan: ${japan?.name} ${japan?.emoji}'); // "Japan 🇯🇵"
```

#### Search Countries

```dart
// Search by partial name (case insensitive)
final unitedCountries = QCountries.search('United');
print('Found ${unitedCountries.length} countries'); // United States, United Kingdom, etc.

// Search returns all matches
for (final country in unitedCountries) {
  print('${country.name} (${country.iso2}) ${country.emoji}');
}

// Empty search returns all countries
final allResults = QCountries.search('');
print('All countries: ${allResults.length}'); // Same as QCountries.all.length
```

#### Utility Lists for UI Components

```dart
// Get lists for dropdowns and selectors
final countryNames = QCountries.names;          // List<String> of all country names
final iso2Codes = QCountries.iso2Codes;         // List<String> of all ISO2 codes
final iso3Codes = QCountries.iso3Codes;         // List<String> of all ISO3 codes
final phoneCodes = QCountries.phoneCodes;       // List<String> of all phone codes
final flagEmojis = QCountries.emojis;           // List<String> of all flag emojis

// Example: Create a country dropdown
Widget buildCountryDropdown() {
  return DropdownButton<String>(
    items: QCountries.all.map((country) {
      return DropdownMenuItem(
        value: country.iso2,
        child: Row(
          children: [
            Text(country.emoji),
            SizedBox(width: 8),
            Text(country.name),
          ],
        ),
      );
    }).toList(),
    onChanged: (String? selectedCountryCode) {
      final selectedCountry = QCountries.byIso2(selectedCountryCode!);
      print('Selected: ${selectedCountry?.name}');
    },
  );
}

// Example: Phone number input with country code
Widget buildPhoneInput() {
  return Row(
    children: [
      // Country code dropdown
      DropdownButton<String>(
        items: QCountries.phoneCodes.map((code) {
          final country = QCountries.byPhoneCode(code);
          return DropdownMenuItem(
            value: code,
            child: Text('${country?.emoji} $code'),
          );
        }).toList(),
        onChanged: (code) => print('Selected code: $code'),
      ),
      // Phone number input
      Expanded(
        child: TextField(
          decoration: InputDecoration(hintText: 'Phone number'),
        ),
      ),
    ],
  );
}
```

#### Country Data Model

```dart
// QCountry class structure
class QCountry {
  final String name;       // "United States"
  final String iso2;       // "US"
  final String iso3;       // "USA"
  final String phoneCode;  // "+1"
  final String emoji;      // "🇺🇸"
  
  // Equality based on ISO2 code
  bool operator ==(Object other) => other is QCountry && iso2 == other.iso2;
  int get hashCode => iso2.hashCode;
  
  // String representation
  String toString() => '$name ($iso2)'; // "United States (US)"
}
```

#### Real-World Examples

```dart
// Address form with country selection
class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  QCountry? selectedCountry;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Country picker
        DropdownButtonFormField<QCountry>(
          decoration: InputDecoration(labelText: 'Country'),
          value: selectedCountry,
          items: QCountries.all.map((country) {
            return DropdownMenuItem(
              value: country,
              child: Row(
                children: [
                  Text(country.emoji, style: TextStyle(fontSize: 20)),
                  SizedBox(width: 12),
                  Expanded(child: Text(country.name)),
                  Text('(${country.iso2})', style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }).toList(),
          onChanged: (country) => setState(() => selectedCountry = country),
        ),
        
        // Show phone code if country selected
        if (selectedCountry != null)
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixText: '${selectedCountry!.phoneCode} ',
                prefixIcon: Text(selectedCountry!.emoji),
              ),
            ),
          ),
      ],
    );
  }
}

// Search functionality
class CountrySearchWidget extends StatefulWidget {
  @override
  _CountrySearchWidgetState createState() => _CountrySearchWidgetState();
}

class _CountrySearchWidgetState extends State<CountrySearchWidget> {
  List<QCountry> searchResults = QCountries.all;
  
  void _onSearchChanged(String query) {
    setState(() {
      searchResults = QCountries.search(query);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Search countries...',
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: _onSearchChanged,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final country = searchResults[index];
              return ListTile(
                leading: Text(country.emoji, style: TextStyle(fontSize: 24)),
                title: Text(country.name),
                subtitle: Text('${country.iso2} • ${country.phoneCode}'),
                onTap: () => print('Selected: ${country.name}'),
              );
            },
          ),
        ),
      ],
    );
  }
}
```

### 🎨 QLogger

QLogger provides advanced colorful logging capabilities perfect for debugging and monitoring your applications.

#### Configuration

```dart
// Configure logger settings
QLogger.configure(
  minLevel: LogLevel.debug,      // Minimum log level to display
  maxLineLength: 120,            // Maximum line length before wrapping
  wrapIndent: '    ',           // Indentation for wrapped lines
);
```

#### Basic Logging

```dart
// Different log levels with automatic coloring
QLogger.debug('Debug information');
QLogger.info('General information');
QLogger.warning('Warning message');
QLogger.error('Error occurred');
QLogger.fatal('Critical error');

// Custom colored logging
QLogger.custom('Custom message', color: AnsiColor.magenta);
```

#### Tagged Logging

```dart
// Add tags for better organization
QLogger.info('User logged in', tag: 'AUTH');
QLogger.error('Database connection failed', tag: 'DB');

// Create a tagged logger instance
final authLogger = QLogger.withTag('AUTH');
authLogger.info('Authentication successful');
authLogger.warning('Invalid token detected');
```

#### Error Logging with Context

```dart
try {
  // Some operation that might fail
  throw Exception('Network timeout');
} catch (error, stackTrace) {
  QLogger.error(
    'Failed to fetch user data',
    tag: 'API',
    error: error,
    stackTrace: stackTrace,
  );
}
```

#### JSON Logging

```dart
// Log complex data structures
final userData = {
  'id': 123,
  'name': 'John Doe',
  'preferences': {
    'theme': 'dark',
    'notifications': true,
  },
};

QLogger.json(userData, tag: 'USER_DATA', level: LogLevel.info);
```

#### Performance Logging

```dart
final stopwatch = Stopwatch()..start();

// Your operation here
await performComplexOperation();

stopwatch.stop();
QLogger.info(
  'Operation completed in ${stopwatch.elapsedMilliseconds}ms',
  tag: 'PERFORMANCE',
);
```

### 🕒 DateTime Extensions

```dart
final date = DateTime.now();

// Formatting
print(date.format('MMM dd, yyyy')); // "Dec 25, 2023"
print(date.toDateString()); // "2023-12-25"
print(date.toTimeString()); // "10:30:45"

// Properties
print(date.isToday); // true
print(date.dayName); // "Monday"
print(date.quarter); // 4
print(date.weekOfYear); // 52

// Manipulation
print(date.startOfDay); // Today at 00:00:00
print(date.addMonths(3)); // 3 months from now
print(date.startOfWeek); // Monday of this week

// Relative time
final yesterday = date.subtract(Duration(days: 1));
print(yesterday.timeAgo()); // "1 day ago"
```

### 🔄 Type Conversion

```dart
// Safe conversions with fallbacks
print('42'.asIntSafe()); // 42
print('invalid'.asIntSafe(0)); // 0 (fallback)
print('42.5'.asDoubleSafe()); // 42.5
print('true'.asBoolSafe()); // true
print('yes'.asBoolSafe()); // true

// Byte conversion
print(QTypeConversion.bytesToHuman(1048576)); // "1.00 MB"
print(QTypeConversion.humanToBytes('1.5 GB')); // 1610612736
```

### 🎨 Colors

```dart
// Access curated color collections
print(QColors.allColors.length); // 50+
print(QColors.vibrantColors.length); // 8
print(QColors.pastelColors.length); // 8

// Get random colors
final randomColor = QColors.random();
final randomVibrant = QColors.randomVibrant();

// Color manipulation
final baseColor = QColors.electricBlue;
final lighter = baseColor.lighten(0.3);
final darker = baseColor.darken(0.2);
final complement = baseColor.complement;

// Color conversion
print(baseColor.toHex()); // "#0080FF"
print(baseColor.toRgbList()); // [0, 128, 255]

// Color schemes
final monochromatic = baseColor.monochromaticScheme; // 5 colors
final analogous = baseColor.analogousScheme; // 5 colors
final triadic = baseColor.triadicScheme; // 3 colors
```

---

## 🧪 Testing

QUtils includes comprehensive test coverage for all features including the countries database:

```bash
# Run all tests
dart test

# Run specific test file
dart test test/countries_test.dart
dart test test/qlogger_test.dart

# Run with coverage
dart test --coverage
```

### Test Coverage

- ✅ **Countries**: All lookup methods, search functionality, data integrity
- ✅ **QLogger**: All log levels, tagging, JSON logging, configuration
- ✅ **DateTime**: All utility methods and extensions
- ✅ **Type Conversion**: Safe conversions with edge cases
- ✅ **File Utilities**: Type detection, path manipulation
- ✅ **Colors**: Color manipulation and scheme generation
- ✅ **QR Codes**: Generation and validation
- ✅ **JSON**: Parsing, validation, prettification

---

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Dart team for the powerful language
- Open source community for inspiration and feedback

---

**Made with ❤️ for the Flutter community**
