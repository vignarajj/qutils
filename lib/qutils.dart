/// QUtils - A comprehensive utility package for Dart/Flutter
///
/// Provides datetime utilities, type conversion, file info, QR code generation,
/// JSON operations, color collections, country data, and convenient extensions.
///
/// Features:
/// - DateTime utilities with formatting and relative time
/// - Safe type conversion with fallbacks
/// - File information extraction and validation
/// - QR code generation and styling
/// - JSON prettification and validation
/// - 100+ curated colors with utilities
/// - Complete country data with ISO codes and phone codes
/// - Comprehensive extensions on core types
library;

// Core utilities and base types
export 'src/qutils_base.dart';
export 'src/qlogger.dart';
export 'src/datetime_utils.dart';
export 'src/json_utils.dart';
export 'src/qcolors.dart';
export 'src/qrcode_utils.dart';
export 'src/file_info_utils.dart';
export 'src/type_conversion.dart';
export 'src/countries.dart';

// Extensions
export 'extensions/datetime_extensions.dart';
export 'extensions/string_extensions.dart';
export 'extensions/color_extensions.dart';
export 'extensions/file_extensions.dart';
