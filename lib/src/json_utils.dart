import 'dart:convert';

/// JSON validation result
class JSONValidationResult {
  final bool isValid;
  final String? error;
  final int? errorPosition;

  JSONValidationResult({
    required this.isValid,
    this.error,
    this.errorPosition,
  });
}

/// Comprehensive JSON utilities for QUtils
class QJSONUtils {
  /// Prettifies a JSON string with proper indentation
  /// 
  /// [jsonString] The JSON string to prettify
  /// [indent] The indentation string (defaults to 2 spaces)
  /// 
  /// Returns the prettified JSON string or null if parsing fails
  /// 
  /// Example:
  /// ```dart
  /// final minified = '{"name":"John","age":30}';
  /// final pretty = QJSONUtils.prettify(minified);
  /// print(pretty);
  /// // {
  /// //   "name": "John",
  /// //   "age": 30
  /// // }
  /// ```
  static String? prettify(String jsonString, {String indent = '  '}) {
    if (jsonString.isEmpty) return null;
    
    try {
      final dynamic jsonObject = jsonDecode(jsonString);
      final encoder = JsonEncoder.withIndent(indent);
      return encoder.convert(jsonObject);
    } catch (e) {
      return null;
    }
  }
  
  /// Minifies a JSON string by removing whitespace
  /// 
  /// [jsonString] The JSON string to minify
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
  /// final minified = QJSONUtils.minify(pretty);
  /// print(minified); // {"name":"John","age":30}
  /// ```
  static String? minify(String jsonString) {
    if (jsonString.isEmpty) return null;
    
    try {
      final dynamic jsonObject = jsonDecode(jsonString);
      return jsonEncode(jsonObject);
    } catch (e) {
      return null;
    }
  }
  
  /// Converts an object to JSON string
  ///
  /// [object] The object to convert
  /// [fallback] The value to return if conversion fails
  ///
  /// Returns the JSON string or fallback if conversion fails
  ///
  /// Example:
  /// ```dart
  /// final json = QJSONUtils.toJSONString({'name': 'John', 'age': 30});
  /// print(json); // {"name":"John","age":30}
  /// ```
  static String? toJSONString(dynamic object, [String? fallback]) {
    try {
      return jsonEncode(object);
    } catch (e) {
      return fallback;
    }
  }

  /// Validates JSON string
  ///
  /// [jsonString] The string to validate
  /// 
  /// Returns a validation result with success status and message
  /// 
  /// Example:
  /// ```dart
  /// final result = QJSONUtils.validate('{"name":"John"}');
  /// if (result.isValid) {
  ///   print('Valid JSON');
  /// } else {
  ///   print('Error: ${result.errorMessage}');
  /// }
  /// ```
  static JSONValidationResult validate(String jsonString) {
    if (jsonString.isEmpty) {
      return JSONValidationResult(
        isValid: false,
        error: 'Empty JSON string',
      );
    }
    
    try {
      jsonDecode(jsonString);
      return JSONValidationResult(isValid: true);
    } catch (e) {
      return JSONValidationResult(
        isValid: false,
        error: e.toString(),
      );
    }
  }
  
  /// Safely parses JSON string to Map
  ///
  /// [jsonString] The JSON string to parse
  /// [fallback] The value to return if parsing fails
  /// 
  /// Returns the parsed Map or fallback if parsing fails
  /// 
  /// Example:
  /// ```dart
  /// final map = QJSONUtils.parseToMap('{"name":"John","age":30}');
  /// print(map?['name']); // John
  /// ```
  static Map<String, dynamic>? parseToMap(String jsonString, [Map<String, dynamic>? fallback]) {
    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
    } catch (_) {}
    return fallback;
  }
  
  /// Safely parses JSON string to List
  ///
  /// [jsonString] The JSON string to parse
  /// [fallback] The value to return if parsing fails
  /// 
  /// Returns the parsed List or fallback if parsing fails
  /// 
  /// Example:
  /// ```dart
  /// final list = QJSONUtils.parseToList('[1,2,3]');
  /// print(list); // [1, 2, 3]
  /// ```
  static List<dynamic>? parseToList(String jsonString, [List<dynamic>? fallback]) {
    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is List) {
        return decoded;
      }
    } catch (_) {}
    return fallback;
  }
  
  /// Gets the size of JSON string in bytes
  ///
  /// [jsonString] The JSON string to measure
  /// 
  /// Returns the size in bytes or null if string is invalid
  /// 
  /// Example:
  /// ```dart
  /// final size = QJSONUtils.getSize('{"name":"John"}');
  /// print(size); // Number of bytes
  /// ```
  static int? getSize(String jsonString) {
    if (!validate(jsonString).isValid) return null;
    return jsonString.length;
  }
  
  /// Gets human-readable size of JSON string
  ///
  /// [jsonString] The JSON string to measure
  /// [decimals] Number of decimal places (defaults to 2)
  /// 
  /// Returns the human-readable size or null if string is invalid
  /// 
  /// Example:
  /// ```dart
  /// final size = QJSONUtils.getHumanSize('{"name":"John"}');
  /// print(size); // "15 B" or similar
  /// ```
  static String? getHumanSize(String jsonString, {int decimals = 2}) {
    final size = getSize(jsonString);
    if (size == null) return null;

    if (size == 0) return '0 B';

    const units = ['B', 'KB', 'MB', 'GB'];
    final i = (size.bitLength - 1) ~/ 10;
    final humanSize = size / (1 << (i * 10));

    return '${humanSize.toStringAsFixed(decimals)} ${units[i]}';
  }
  
  /// Extracts a value from JSON using dot notation
  ///
  /// [jsonString] The JSON string to search
  /// [path] The dot notation path (e.g., 'user.profile.name')
  /// [fallback] The value to return if path is not found
  /// 
  /// Returns the value at the path or fallback if not found
  /// 
  /// Example:
  /// ```dart
  /// final json = '{"user":{"profile":{"name":"John"}}}';
  /// final name = QJSONUtils.extractValue(json, 'user.profile.name');
  /// print(name); // John
  /// ```
  static dynamic extractValue(String jsonString, String path, [dynamic fallback]) {
    try {
      final decoded = jsonDecode(jsonString);
      return _extractFromPath(decoded, path.split('.')) ?? fallback;
    } catch (_) {
      return fallback;
    }
  }
  
  /// Counts keys in JSON object
  ///
  /// [jsonString] The JSON string to analyze
  /// [recursive] Whether to count nested keys (defaults to true)
  /// 
  /// Returns the number of keys or null if JSON is invalid
  /// 
  /// Example:
  /// ```dart
  /// final json = '{"name":"John","details":{"age":30,"city":"NYC"}}';
  /// final count = QJSONUtils.countKeys(json); // 4 (name, details, age, city)
  /// ```
  static int? countKeys(String jsonString, {bool recursive = true}) {
    try {
      final decoded = jsonDecode(jsonString);
      return _countKeysRecursive(decoded, recursive);
    } catch (_) {
      return null;
    }
  }

  /// Compare two JSON strings for equality
  static bool areEqual(String json1, String json2) {
    try {
      final decoded1 = jsonDecode(json1);
      final decoded2 = jsonDecode(json2);
      return _deepEquals(decoded1, decoded2);
    } catch (_) {
      return false;
    }
  }

  static bool _deepEquals(dynamic a, dynamic b) {
    if (a.runtimeType != b.runtimeType) return false;

    if (a is Map && b is Map) {
      if (a.length != b.length) return false;
      for (final key in a.keys) {
        if (!b.containsKey(key) || !_deepEquals(a[key], b[key])) {
          return false;
        }
      }
      return true;
    }

    if (a is List && b is List) {
      if (a.length != b.length) return false;
      for (int i = 0; i < a.length; i++) {
        if (!_deepEquals(a[i], b[i])) return false;
      }
      return true;
    }

    return a == b;
  }

  static dynamic _extractFromPath(dynamic obj, List<String> pathParts) {
    if (pathParts.isEmpty) return obj;

    final key = pathParts.first;
    final remainingPath = pathParts.skip(1).toList();

    if (obj is Map && obj.containsKey(key)) {
      return _extractFromPath(obj[key], remainingPath);
    } else if (obj is List && int.tryParse(key) != null) {
      final index = int.parse(key);
      if (index >= 0 && index < obj.length) {
        return _extractFromPath(obj[index], remainingPath);
      }
    }

    return null;
  }
  
  static int _countKeysRecursive(dynamic obj, bool recursive) {
    if (obj is Map) {
      int count = obj.length;
      if (recursive) {
        for (final value in obj.values) {
          count += _countKeysRecursive(value, recursive);
        }
      }
      return count;
    } else if (obj is List && recursive) {
      int count = 0;
      for (final item in obj) {
        count += _countKeysRecursive(item, recursive);
      }
      return count;
    }
    return 0;
  }
}
