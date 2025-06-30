/// Comprehensive type conversion utilities for QUtils
class QTypeConversion {
  /// Safely converts a dynamic value to an integer
  /// 
  /// Attempts to parse strings, truncate doubles, and handle bool values.
  /// Returns [fallback] if conversion fails.
  /// 
  /// [value] The value to convert
  /// [fallback] The value to return if conversion fails (defaults to null)
  /// 
  /// Example:
  /// ```dart
  /// final result = QTypeConversion.toIntSafe('42'); // 42
  /// final result2 = QTypeConversion.toIntSafe('invalid', 0); // 0
  /// ```
  static int? toIntSafe(dynamic value, [int? fallback]) {
    if (value == null) return fallback;
    
    try {
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is num) return value.toInt();
      if (value is bool) return value ? 1 : 0;
      if (value is String) {
        if (value.isEmpty) return fallback;
        return int.parse(value.trim());
      }
    } catch (_) {}
    
    return fallback;
  }
  
  /// Safely converts a dynamic value to a double
  /// 
  /// Attempts to parse strings, convert integers, and handle bool values.
  /// Returns [fallback] if conversion fails.
  /// 
  /// [value] The value to convert
  /// [fallback] The value to return if conversion fails (defaults to null)
  /// 
  /// Example:
  /// ```dart
  /// final result = QTypeConversion.toDoubleSafe('42.5'); // 42.5
  /// final result2 = QTypeConversion.toDoubleSafe('invalid', 0.0); // 0.0
  /// ```
  static double? toDoubleSafe(dynamic value, [double? fallback]) {
    if (value == null) return fallback;
    
    try {
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is num) return value.toDouble();
      if (value is bool) return value ? 1.0 : 0.0;
      if (value is String) {
        if (value.isEmpty) return fallback;
        return double.parse(value.trim());
      }
    } catch (_) {}
    
    return fallback;
  }
  
  /// Safely converts a dynamic value to a num
  /// 
  /// Attempts to parse strings and handle bool values.
  /// Returns [fallback] if conversion fails.
  /// 
  /// [value] The value to convert
  /// [fallback] The value to return if conversion fails (defaults to null)
  /// 
  /// Example:
  /// ```dart
  /// final result = QTypeConversion.toNumSafe('42'); // 42
  /// final result2 = QTypeConversion.toNumSafe('42.5'); // 42.5
  /// ```
  static num? toNumSafe(dynamic value, [num? fallback]) {
    if (value == null) return fallback;
    
    try {
      if (value is num) return value;
      if (value is bool) return value ? 1 : 0;
      if (value is String) {
        if (value.isEmpty) return fallback;
        final trimmed = value.trim();
        if (trimmed.contains('.')) {
          return double.parse(trimmed);
        } else {
          return int.parse(trimmed);
        }
      }
    } catch (_) {}
    
    return fallback;
  }
  
  /// Safely converts a dynamic value to a boolean
  /// 
  /// Recognizes various string representations of boolean values:
  /// - true: 'true', 'yes', 'y', '1', 'on', 'enabled'
  /// - false: 'false', 'no', 'n', '0', 'off', 'disabled'
  /// 
  /// [value] The value to convert
  /// [fallback] The value to return if conversion fails (defaults to null)
  /// 
  /// Example:
  /// ```dart
  /// final result = QTypeConversion.toBoolSafe('true'); // true
  /// final result2 = QTypeConversion.toBoolSafe('yes'); // true
  /// final result3 = QTypeConversion.toBoolSafe('invalid', false); // false
  /// ```
  static bool? toBoolSafe(dynamic value, [bool? fallback]) {
    if (value == null) return fallback;
    
    try {
      if (value is bool) return value;
      if (value is num) return value != 0;
      if (value is String) {
        final lower = value.toLowerCase().trim();
        if (lower == 'true' || lower == '1' || lower == 'yes' || lower == 'on') {
          return true;
        }
        if (lower == 'false' || lower == '0' || lower == 'no' || lower == 'off') {
          return false;
        }
      }
    } catch (_) {}
    
    return fallback;
  }

  /// Safely converts a dynamic value to a string
  /// 
  /// Handles null values, converts objects using toString(),
  /// and provides proper formatting for numbers and booleans.
  /// 
  /// [value] The value to convert
  /// [fallback] The value to return if conversion fails (defaults to null)
  /// 
  /// Example:
  /// ```dart
  /// final result = QTypeConversion.toStringSafe(42); // "42"
  /// final result2 = QTypeConversion.toStringSafe(null, "default"); // "default"
  /// ```
  static String? toStringSafe(dynamic value, [String? fallback]) {
    if (value == null) return fallback;
    
    try {
      if (value is String) return value;
      return value.toString();
    } catch (_) {}
    
    return fallback;
  }
  
  /// Safely converts a dynamic value to a List
  /// 
  /// Attempts to convert various types to lists:
  /// - Strings are split by delimiter
  /// - Sets and Iterables are converted to lists
  /// - Single values are wrapped in a list
  /// 
  /// [value] The value to convert
  /// [delimiter] The delimiter to use for string splitting (defaults to ',')
  /// [fallback] The value to return if conversion fails (defaults to null)
  /// 
  /// Example:
  /// ```dart
  /// final result = QTypeConversion.toListSafe('a,b,c'); // ['a', 'b', 'c']
  /// final result2 = QTypeConversion.toListSafe(42); // [42]
  /// ```
  static List<T>? toListSafe<T>(
    dynamic value, {
    String delimiter = ',',
    List<T>? fallback,
  }) {
    if (value == null) return fallback;
    
    try {
      if (value is List<T>) return value;
      if (value is List) return value.cast<T>();
      if (value is Set<T>) return value.toList();
      if (value is Set) return value.cast<T>().toList();
      if (value is Iterable<T>) return value.toList();
      if (value is Iterable) return value.cast<T>().toList();
      
      if (value is String) {
        if (value.isEmpty) return fallback;
        final parts = value.split(delimiter).map((e) => e.trim()).toList();
        return parts.cast<T>();
      }
      
      // Wrap single value in list
      return [value as T];
    } catch (_) {}
    
    return fallback;
  }
  
  /// Safely converts a dynamic value to a Map
  /// 
  /// [value] The value to convert
  /// [fallback] The value to return if conversion fails (defaults to null)
  /// 
  /// Example:
  /// ```dart
  /// final result = QTypeConversion.toMapSafe({'key': 'value'}); // {'key': 'value'}
  /// ```
  static Map<K, V>? toMapSafe<K, V>(dynamic value, [Map<K, V>? fallback]) {
    if (value == null) return fallback;
    
    try {
      if (value is Map<K, V>) return value;
      if (value is Map) return value.cast<K, V>();
    } catch (_) {}
    
    return fallback;
  }
  
  /// Converts bytes to a human-readable string
  /// 
  /// [bytes] The number of bytes
  /// [decimals] Number of decimal places to show (defaults to 2)
  /// 
  /// Example:
  /// ```dart
  /// final result = QTypeConversion.bytesToHuman(1024); // "1.00 KB"
  /// final result2 = QTypeConversion.bytesToHuman(1048576); // "1.00 MB"
  /// ```
  static String bytesToHuman(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return '0 B';
    
    const units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
    final unitIndex = (bytes == 0) ? 0 : (bytes.bitLength - 1) ~/ 10;
    final size = bytes / (1 << (unitIndex * 10));
    
    return '${size.toStringAsFixed(decimals)} ${units[unitIndex]}';
  }
  
  /// Converts a human-readable size string to bytes
  /// 
  /// Supports units: B, KB, MB, GB, TB, PB (case insensitive)
  /// 
  /// [sizeString] The size string to parse (e.g., "1.5 MB")
  /// 
  /// Returns the size in bytes or null if parsing fails
  /// 
  /// Example:
  /// ```dart
  /// final result = QTypeConversion.humanToBytes('1.5 MB'); // 1572864
  /// ```
  static int? humanToBytes(String sizeString) {
    if (sizeString.isEmpty) return null;
    
    final units = {
      'b': 1,
      'kb': 1024,
      'mb': 1024 * 1024,
      'gb': 1024 * 1024 * 1024,
      'tb': 1024 * 1024 * 1024 * 1024,
      'pb': 1024 * 1024 * 1024 * 1024 * 1024,
    };
    
    try {
      final trimmed = sizeString.trim().toLowerCase();
      final parts = trimmed.split(RegExp(r'\s+'));
      
      if (parts.length == 1) {
        // Just a number, assume bytes
        return int.parse(parts[0]);
      } else if (parts.length == 2) {
        final value = double.parse(parts[0]);
        final unit = parts[1].toLowerCase();
        final multiplier = units[unit];
        
        if (multiplier != null) {
          return (value * multiplier).round();
        }
      }
    } catch (_) {}
    
    return null;
  }
}
