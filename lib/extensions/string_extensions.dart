import '../src/type_conversion.dart';
import '../src/json_utils.dart';
import '../src/datetime_utils.dart';
import '../src/file_info_utils.dart';

/// String extensions for QUtils
///
/// Provides convenient extension methods on String objects for type conversion,
/// JSON operations, and utility functions.
extension QStringExtensions on String {
  // ======================== TYPE CONVERSION ========================

  /// Safely converts this string to an integer
  ///
  /// [fallback] The value to return if conversion fails (defaults to null)
  ///
  /// Returns the parsed integer or fallback if conversion fails
  ///
  /// Example:
  /// ```dart
  /// print('42'.asIntSafe()); // 42
  /// print('invalid'.asIntSafe(0)); // 0
  /// print('invalid'.asIntSafe()); // null
  /// ```
  int? asIntSafe([int? fallback]) {
    return QTypeConversion.toIntSafe(this, fallback);
  }

  /// Safely converts this string to a double
  ///
  /// [fallback] The value to return if conversion fails (defaults to null)
  ///
  /// Returns the parsed double or fallback if conversion fails
  ///
  /// Example:
  /// ```dart
  /// print('42.5'.asDoubleSafe()); // 42.5
  /// print('invalid'.asDoubleSafe(0.0)); // 0.0
  /// print('invalid'.asDoubleSafe()); // null
  /// ```
  double? asDoubleSafe([double? fallback]) {
    return QTypeConversion.toDoubleSafe(this, fallback);
  }

  /// Safely converts this string to a num
  ///
  /// [fallback] The value to return if conversion fails (defaults to null)
  ///
  /// Returns the parsed num or fallback if conversion fails
  ///
  /// Example:
  /// ```dart
  /// print('42'.asNumSafe()); // 42
  /// print('42.5'.asNumSafe()); // 42.5
  /// print('invalid'.asNumSafe(0)); // 0
  /// ```
  num? asNumSafe([num? fallback]) {
    return QTypeConversion.toNumSafe(this, fallback);
  }

  /// Safely converts this string to a boolean
  ///
  /// Recognizes various string representations:
  /// - true: 'true', 'yes', 'y', '1', 'on', 'enabled'
  /// - false: 'false', 'no', 'n', '0', 'off', 'disabled'
  ///
  /// [fallback] The value to return if conversion fails (defaults to null)
  ///
  /// Returns the parsed boolean or fallback if conversion fails
  ///
  /// Example:
  /// ```dart
  /// print('true'.asBoolSafe()); // true
  /// print('yes'.asBoolSafe()); // true
  /// print('invalid'.asBoolSafe(false)); // false
  /// ```
  bool? asBoolSafe([bool? fallback]) {
    return QTypeConversion.toBoolSafe(this, fallback);
  }

  /// Safely converts this string to a List by splitting
  ///
  /// [delimiter] The delimiter to split on (defaults to ',')
  /// [fallback] The value to return if conversion fails
  ///
  /// Returns the split list or fallback if conversion fails
  ///
  /// Example:
  /// ```dart
  /// print('a,b,c'.asListSafe()); // ['a', 'b', 'c']
  /// print('a;b;c'.asListSafe(delimiter: ';')); // ['a', 'b', 'c']
  /// ```
  List<T>? asListSafe<T>({String delimiter = ',', List<T>? fallback}) {
    return QTypeConversion.toListSafe<T>(
      this,
      delimiter: delimiter,
      fallback: fallback,
    );
  }

  /// Safely converts this string to a DateTime
  ///
  /// [customFormats] Additional date formats to try
  /// [fallback] The value to return if parsing fails
  ///
  /// Returns the parsed DateTime or fallback if parsing fails
  ///
  /// Example:
  /// ```dart
  /// print('2023-12-25'.asDateTimeSafe()); // DateTime instance
  /// print('invalid'.asDateTimeSafe()); // null
  /// ```
  DateTime? asDateTimeSafe({List<String>? customFormats, DateTime? fallback}) {
    final result = QDateTimeUtils.parseFlexible(this);
    return result ?? fallback;
  }

  // ======================== JSON OPERATIONS ========================

  /// Prettifies this JSON string with proper indentation
  ///
  /// [indent] The indentation string (defaults to 2 spaces)
  ///
  /// Returns the prettified JSON string or null if parsing fails
  ///
  /// Example:
  /// ```dart
  /// final minified = '{"name":"John","age":30}';
  /// print(minified.jsonPrettify());
  /// // {
  /// //   "name": "John",
  /// //   "age": 30
  /// // }
  /// ```
  String? jsonPrettify({String indent = '  '}) {
    return QJSONUtils.prettify(this, indent: indent);
  }

  /// Minifies this JSON string by removing whitespace
  ///
  /// Returns the minified JSON string or null if parsing fails
  ///
  /// Example:
  /// ```dart
  /// final pretty = '''
  /// {
  ///   "name": "John",
  ///   "age": 30
  /// }
  /// ''';
  /// print(pretty.jsonMinify()); // {"name":"John","age":30}
  /// ```
  String? jsonMinify() {
    return QJSONUtils.minify(this);
  }

  /// Validates if this string is valid JSON
  ///
  /// Returns a validation result with success status and message
  ///
  /// Example:
  /// ```dart
  /// final result = '{"name":"John"}'.jsonValidate();
  /// if (result.isValid) {
  ///   print('Valid JSON');
  /// }
  /// ```
  JSONValidationResult jsonValidate() {
    return QJSONUtils.validate(this);
  }

  /// Checks if this string is valid JSON
  ///
  /// Returns true if the string is valid JSON, false otherwise
  ///
  /// Example:
  /// ```dart
  /// print('{"name":"John"}'.isValidJSON); // true
  /// print('invalid json'.isValidJSON); // false
  /// ```
  bool get isValidJSON {
    return jsonValidate().isValid;
  }

  /// Safely parses this JSON string to a Map
  ///
  /// [fallback] The value to return if parsing fails
  ///
  /// Returns the parsed Map or fallback if parsing fails
  ///
  /// Example:
  /// ```dart
  /// final map = '{"name":"John","age":30}'.asMapFromJSON();
  /// print(map?['name']); // John
  /// ```
  Map<String, dynamic>? asMapFromJSON([Map<String, dynamic>? fallback]) {
    return QJSONUtils.parseToMap(this, fallback);
  }

  /// Safely parses this JSON string to a List
  ///
  /// [fallback] The value to return if parsing fails
  ///
  /// Returns the parsed List or fallback if parsing fails
  ///
  /// Example:
  /// ```dart
  /// final list = '[1,2,3]'.asListFromJSON();
  /// print(list); // [1, 2, 3]
  /// ```
  List<dynamic>? asListFromJSON([List<dynamic>? fallback]) {
    return QJSONUtils.parseToList(this, fallback);
  }

  /// Gets the size of this JSON string in bytes
  ///
  /// Returns the size in bytes or null if string is invalid JSON
  ///
  /// Example:
  /// ```dart
  /// final size = '{"name":"John"}'.jsonSize();
  /// ```
  int? jsonSize() {
    return QJSONUtils.getSize(this);
  }

  /// Gets human-readable size of this JSON string
  ///
  /// [decimals] Number of decimal places (defaults to 2)
  ///
  /// Returns the human-readable size or null if string is invalid JSON
  ///
  /// Example:
  /// ```dart
  /// final size = '{"name":"John"}'.jsonHumanSize();
  /// print(size); // "15 B" or similar
  /// ```
  String? jsonHumanSize({int decimals = 2}) {
    return QJSONUtils.getHumanSize(this, decimals: decimals);
  }

  /// Extracts a value from this JSON string using dot notation path
  ///
  /// [path] The dot notation path (e.g., 'user.profile.name')
  /// [fallback] The value to return if path is not found
  ///
  /// Returns the value at the path or fallback if not found
  ///
  /// Example:
  /// ```dart
  /// final json = '{"user":{"profile":{"name":"John"}}}';
  /// final name = json.jsonExtract('user.profile.name');
  /// print(name); // John
  /// ```
  dynamic jsonExtract(String path, [dynamic fallback]) {
    return QJSONUtils.extractValue(this, path, fallback);
  }

  /// Counts the number of keys in this JSON object
  ///
  /// [recursive] Whether to count nested keys (defaults to true)
  ///
  /// Returns the number of keys or null if JSON is invalid
  ///
  /// Example:
  /// ```dart
  /// final json = '{"name":"John","details":{"age":30,"city":"NYC"}}';
  /// final count = json.jsonKeyCount(); // 4
  /// ```
  int? jsonKeyCount({bool recursive = true}) {
    return QJSONUtils.countKeys(this, recursive: recursive);
  }

  // ======================== STRING UTILITIES ========================

  /// Checks if this string is null or empty
  ///
  /// Example:
  /// ```dart
  /// print(''.isNullOrEmpty); // true
  /// print('hello'.isNullOrEmpty); // false
  /// ```
  bool get isNullOrEmpty => isEmpty;

  /// Checks if this string is null, empty, or contains only whitespace
  ///
  /// Example:
  /// ```dart
  /// print('   '.isNullOrWhitespace); // true
  /// print('hello'.isNullOrWhitespace); // false
  /// ```
  bool get isNullOrWhitespace => trim().isEmpty;

  /// Checks if this string contains only digits
  ///
  /// Example:
  /// ```dart
  /// print('123'.isNumeric); // true
  /// print('12.3'.isNumeric); // false
  /// print('abc'.isNumeric); // false
  /// ```
  bool get isNumeric {
    if (isEmpty) return false;
    return int.tryParse(this) != null;
  }

  /// Checks if this string is a valid number (int or double)
  ///
  /// Example:
  /// ```dart
  /// print('123'.isNumber); // true
  /// print('12.3'.isNumber); // true
  /// print('abc'.isNumber); // false
  /// ```
  bool get isNumber {
    if (isEmpty) return false;
    return num.tryParse(this) != null;
  }

  /// Checks if this string is a valid email address
  ///
  /// Example:
  /// ```dart
  /// print('user@example.com'.isEmail); // true
  /// print('invalid-email'.isEmail); // false
  /// ```
  bool get isEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  /// Checks if this string is a valid URL
  ///
  /// Example:
  /// ```dart
  /// print('https://example.com'.isURL); // true
  /// print('invalid-url'.isURL); // false
  /// ```
  bool get isURL {
    try {
      final uri = Uri.parse(this);
      return uri.hasScheme && uri.hasAuthority;
    } catch (_) {
      return false;
    }
  }

  /// Capitalizes the first letter of this string
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.capitalize()); // "Hello world"
  /// ```
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Capitalizes the first letter of each word in this string
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.capitalizeWords()); // "Hello World"
  /// ```
  String capitalizeWords() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Reverses this string
  ///
  /// Example:
  /// ```dart
  /// print('hello'.reverse()); // "olleh"
  /// ```
  String reverse() {
    if (isEmpty) return this;
    return split('').reversed.join('');
  }

  /// Truncates this string to the specified length and adds ellipsis
  ///
  /// [maxLength] Maximum length of the string
  /// [ellipsis] The ellipsis string to append (defaults to '...')
  ///
  /// Example:
  /// ```dart
  /// print('Hello World'.truncate(8)); // "Hello..."
  /// print('Hello World'.truncate(8, ellipsis: '…')); // "Hello W…"
  /// ```
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return substring(0, maxLength - ellipsis.length) + ellipsis;
  }

  /// Removes all non-alphanumeric characters from this string
  ///
  /// [keepSpaces] Whether to keep spaces (defaults to false)
  ///
  /// Example:
  /// ```dart
  /// print('Hello, World!'.alphanumericOnly()); // "HelloWorld"
  /// print('Hello, World!'.alphanumericOnly(keepSpaces: true)); // "Hello World"
  /// ```
  String alphanumericOnly({bool keepSpaces = false}) {
    final pattern = keepSpaces ? r'[^a-zA-Z0-9\s]' : r'[^a-zA-Z0-9]';
    return replaceAll(RegExp(pattern), '');
  }

  /// Counts the number of words in this string
  ///
  /// Example:
  /// ```dart
  /// print('Hello world'.wordCount); // 2
  /// print('Hello,  world!'.wordCount); // 2
  /// ```
  int get wordCount {
    if (isEmpty) return 0;
    return trim().split(RegExp(r'\s+')).length;
  }

  /// Converts this string to camelCase
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.toCamelCase()); // "helloWorld"
  /// print('hello-world'.toCamelCase()); // "helloWorld"
  /// ```
  String toCamelCase() {
    if (isEmpty) return this;
    final words = split(RegExp(r'[\s\-_]+'));
    if (words.isEmpty) return this;

    final first = words.first.toLowerCase();
    final rest = words.skip(1).map((word) => word.capitalize()).join('');
    return first + rest;
  }

  /// Converts this string to PascalCase
  ///
  /// Example:
  /// ```dart
  /// print('hello world'.toPascalCase()); // "HelloWorld"
  /// print('hello-world'.toPascalCase()); // "HelloWorld"
  /// ```
  String toPascalCase() {
    if (isEmpty) return this;
    return split(RegExp(r'[\s\-_]+')).map((word) => word.capitalize()).join('');
  }

  /// Converts this string to snake_case
  ///
  /// Example:
  /// ```dart
  /// print('Hello World'.toSnakeCase()); // "hello_world"
  /// print('HelloWorld'.toSnakeCase()); // "hello_world"
  /// ```
  String toSnakeCase() {
    if (isEmpty) return this;

    // First, handle spaces and hyphens by replacing them with underscores
    String result = replaceAll(RegExp(r'[\s\-]+'), '_');

    // Then handle camelCase/PascalCase by adding underscores before capital letters
    // but avoid duplicate underscores
    result = result.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)}_${match.group(2)}',
    );

    // Convert to lowercase and clean up any duplicate underscores
    return result
        .toLowerCase()
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');
  }

  /// Converts this string to kebab-case
  ///
  /// Example:
  /// ```dart
  /// print('Hello World'.toKebabCase()); // "hello-world"
  /// print('HelloWorld'.toKebabCase()); // "hello-world"
  /// ```
  String toKebabCase() {
    if (isEmpty) return this;

    // First, handle spaces and underscores by replacing them with hyphens
    String result = replaceAll(RegExp(r'[\s_]+'), '-');

    // Then handle camelCase/PascalCase by adding hyphens before capital letters
    // but avoid duplicate hyphens
    result = result.replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)}-${match.group(2)}',
    );

    // Convert to lowercase and clean up any duplicate hyphens
    return result
        .toLowerCase()
        .replaceAll(RegExp(r'-+'), '-')
        .replaceAll(RegExp(r'^-|-$'), '');
  }

  /// Gets the directory path from this file path
  String? get directoryPath => QFileInfoUtils.getDirectory(this);

  /// Gets the file extension from this file path
  String? get fileExtension => QFileInfoUtils.getExtension(this);

  /// Checks if this file path has a valid extension from the given list
  bool hasValidFileExtension(List<String> validExtensions) {
    final ext = fileExtension?.toLowerCase();
    return ext != null &&
        validExtensions.map((e) => e.toLowerCase()).contains(ext);
  }

  /// Formats this string as readable string (returns this string)
  String toReadableString() => this;
}
