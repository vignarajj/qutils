import 'dart:io';
import 'package:path/path.dart' as path;

/// Comprehensive file information utilities for QUtils
class QFileInfoUtils {
  // Common file extension mappings
  static const Map<String, List<String>> _categoryExtensions = {
    'image': [
      'jpg',
      'jpeg',
      'png',
      'gif',
      'bmp',
      'webp',
      'svg',
      'ico',
      'tiff',
      'tif',
    ],
    'video': ['mp4', 'avi', 'mkv', 'mov', 'wmv', 'flv', 'webm', 'm4v', '3gp'],
    'audio': ['mp3', 'wav', 'flac', 'aac', 'ogg', 'wma', 'm4a', 'opus'],
    'document': ['pdf', 'doc', 'docx', 'txt', 'rtf', 'odt', 'pages'],
    'spreadsheet': ['xls', 'xlsx', 'csv', 'ods', 'numbers'],
    'presentation': ['ppt', 'pptx', 'odp', 'key'],
    'archive': ['zip', 'rar', '7z', 'tar', 'gz', 'bz2', 'xz'],
    'code': [
      'dart',
      'js',
      'ts',
      'py',
      'java',
      'cpp',
      'c',
      'h',
      'html',
      'css',
      'php',
      'rb',
      'go',
      'rs',
      'swift',
    ],
  };

  // MIME type mappings for common extensions
  static const Map<String, String> _mimeTypes = {
    'txt': 'text/plain',
    'html': 'text/html',
    'css': 'text/css',
    'js': 'application/javascript',
    'json': 'application/json',
    'xml': 'application/xml',
    'pdf': 'application/pdf',
    'zip': 'application/zip',
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'png': 'image/png',
    'gif': 'image/gif',
    'webp': 'image/webp',
    'svg': 'image/svg+xml',
    'mp4': 'video/mp4',
    'webm': 'video/webm',
    'mp3': 'audio/mpeg',
    'wav': 'audio/wav',
    'ogg': 'audio/ogg',
  };

  /// Gets the file extension from a file path
  ///
  /// [filePath] The file path to extract extension from
  /// [includeDot] Whether to include the dot in the extension (defaults to false)
  ///
  /// Returns the file extension or null if not found
  ///
  /// Example:
  /// ```dart
  /// final ext = QFileInfoUtils.getExtension('/path/to/file.txt'); // 'txt'
  /// final extWithDot = QFileInfoUtils.getExtension('/path/to/file.txt', true); // '.txt'
  /// ```
  static String? getExtension(String filePath, {bool includeDot = false}) {
    if (filePath.isEmpty) return null;

    final extension = path.extension(filePath);
    if (extension.isEmpty) return null;

    return includeDot ? extension : extension.substring(1);
  }

  /// Gets the file name from a file path (including extension)
  ///
  /// [filePath] The file path to extract filename from
  ///
  /// Returns the filename or null if path is invalid
  ///
  /// Example:
  /// ```dart
  /// final name = QFileInfoUtils.getFileName('/path/to/file.txt'); // 'file.txt'
  /// ```
  static String? getFileName(String filePath) {
    if (filePath.isEmpty) return null;
    return path.basename(filePath);
  }

  /// Gets the file name without extension from a file path
  ///
  /// [filePath] The file path to extract base name from
  ///
  /// Returns the base filename or null if path is invalid
  ///
  /// Example:
  /// ```dart
  /// final name = QFileInfoUtils.getBaseName('/path/to/file.txt'); // 'file'
  /// ```
  static String? getBaseName(String filePath) {
    if (filePath.isEmpty) return null;
    return path.basenameWithoutExtension(filePath);
  }

  /// Gets the directory path from a file path
  ///
  /// [filePath] The file path to extract directory from
  ///
  /// Returns the directory path or null if path is invalid
  ///
  /// Example:
  /// ```dart
  /// final dir = QFileInfoUtils.getDirectory('/path/to/file.txt'); // '/path/to'
  /// ```
  static String? getDirectory(String filePath) {
    if (filePath.isEmpty) return null;
    return path.dirname(filePath);
  }

  /// Gets the MIME type for a file based on its extension
  ///
  /// [filePath] The file path or extension to determine MIME type
  ///
  /// Returns the MIME type or null if not determined
  ///
  /// Example:
  /// ```dart
  /// final mime = QFileInfoUtils.getMimeType('/path/to/file.txt'); // 'text/plain'
  /// final mime2 = QFileInfoUtils.getMimeType('image.jpg'); // 'image/jpeg'
  /// ```
  static String? getMimeType(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    if (ext == null) return null;

    return _mimeTypes[ext] ?? 'application/octet-stream';
  }

  /// Checks if the file is an image based on its extension
  ///
  /// [filePath] The file path to check
  ///
  /// Returns true if the file is likely an image based on extension
  ///
  /// Example:
  /// ```dart
  /// final isImage = QFileInfoUtils.isImage('/path/to/photo.jpg'); // true
  /// final isImage2 = QFileInfoUtils.isImage('/path/to/document.pdf'); // false
  /// ```
  static bool isImage(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    return ext != null && _categoryExtensions['image']!.contains(ext);
  }

  /// Checks if the file is a video based on its extension
  ///
  /// [filePath] The file path to check
  ///
  /// Returns true if the file is likely a video based on extension
  ///
  /// Example:
  /// ```dart
  /// final isVideo = QFileInfoUtils.isVideo('/path/to/movie.mp4'); // true
  /// ```
  static bool isVideo(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    return ext != null && _categoryExtensions['video']!.contains(ext);
  }

  /// Checks if the file is an audio file based on its extension
  ///
  /// [filePath] The file path to check
  ///
  /// Returns true if the file is likely an audio file based on extension
  ///
  /// Example:
  /// ```dart
  /// final isAudio = QFileInfoUtils.isAudio('/path/to/song.mp3'); // true
  /// ```
  static bool isAudio(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    return ext != null && _categoryExtensions['audio']!.contains(ext);
  }

  /// Checks if the file is a document based on its extension
  ///
  /// Common document types: PDF, DOC, DOCX, XLS, XLSX, PPT, PPTX, etc.
  ///
  /// [filePath] The file path to check
  ///
  /// Returns true if the file is likely a document based on extension
  ///
  /// Example:
  /// ```dart
  /// final isDoc = QFileInfoUtils.isDocument('/path/to/file.pdf'); // true
  /// ```
  static bool isDocument(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    return ext != null && _categoryExtensions['document']!.contains(ext);
  }

  /// Checks if the file is a spreadsheet based on its extension
  ///
  /// [filePath] The file path to check
  ///
  /// Returns true if the file is likely a spreadsheet based on extension
  ///
  /// Example:
  /// ```dart
  /// final isSheet = QFileInfoUtils.isSpreadsheet('/path/to/file.xlsx'); // true
  /// ```
  static bool isSpreadsheet(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    return ext != null && _categoryExtensions['spreadsheet']!.contains(ext);
  }

  /// Checks if the file is a presentation based on its extension
  ///
  /// [filePath] The file path to check
  ///
  /// Returns true if the file is likely a presentation based on extension
  ///
  /// Example:
  /// ```dart
  /// final isPresentation = QFileInfoUtils.isPresentation('/path/to/file.pptx'); // true
  /// ```
  static bool isPresentation(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    return ext != null && _categoryExtensions['presentation']!.contains(ext);
  }

  /// Checks if the file is an archive based on its extension
  ///
  /// [filePath] The file path to check
  ///
  /// Returns true if the file is likely an archive based on extension
  ///
  /// Example:
  /// ```dart
  /// final isArchive = QFileInfoUtils.isArchive('/path/to/file.zip'); // true
  /// ```
  static bool isArchive(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    return ext != null && _categoryExtensions['archive']!.contains(ext);
  }

  /// Checks if the file is a code file based on its extension
  ///
  /// [filePath] The file path to check
  ///
  /// Returns true if the file is likely a code file based on extension
  ///
  /// Example:
  /// ```dart
  /// final isCode = QFileInfoUtils.isCode('/path/to/file.dart'); // true
  /// ```
  static bool isCode(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    return ext != null && _categoryExtensions['code']!.contains(ext);
  }

  /// Gets the file category based on its extension
  ///
  /// [filePath] The file path to analyze
  ///
  /// Returns the category name (e.g., 'image', 'video', 'audio', etc.) or 'other' if unknown
  ///
  /// Example:
  /// ```dart
  /// final category = QFileInfoUtils.getFileCategory('/path/to/file.mp4'); // 'video'
  /// ```
  static String? getFileCategory(String filePath) {
    final ext = getExtension(filePath)?.toLowerCase();
    if (ext == null) return null;

    for (final category in _categoryExtensions.keys) {
      if (_categoryExtensions[category]!.contains(ext)) {
        return category;
      }
    }

    return 'other';
  }

  /// Gets file size in bytes if file exists
  ///
  /// [filePath] The file path to get size for
  ///
  /// Returns the file size in bytes or null if file doesn't exist or error occurs
  ///
  /// Example:
  /// ```dart
  /// final size = QFileInfoUtils.getFileSize('/path/to/file.txt'); // 1024
  /// ```
  static int? getFileSize(String filePath) {
    try {
      final file = File(filePath);
      if (file.existsSync()) {
        return file.lengthSync();
      }
    } catch (_) {}
    return null;
  }

  /// Gets human-readable file size
  ///
  /// [filePath] The file path to get size for
  /// [decimals] Number of decimal places to show (defaults to 2)
  ///
  /// Returns a human-readable size string
  ///
  /// Example:
  /// ```dart
  /// final readable = QFileInfoUtils.getHumanFileSize('/path/to/file.txt'); // "1.00 KB"
  /// ```
  static String? getHumanFileSize(String filePath, {int decimals = 2}) {
    final bytes = getFileSize(filePath);
    if (bytes == null) return null;

    if (bytes == 0) return '0 B';

    const units = ['B', 'KB', 'MB', 'GB', 'TB'];
    final i = (bytes.bitLength - 1) ~/ 10;
    final size = bytes / (1 << (i * 10));

    return '${size.toStringAsFixed(decimals)} ${units[i]}';
  }

  /// Formats file size in bytes to human readable string
  static String formatFileSize(int bytes, {int decimals = 2}) {
    return bytesToHuman(bytes, decimals: decimals);
  }

  /// Converts bytes to human readable format
  static String bytesToHuman(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return '0 B';

    const units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
    final unitIndex = (bytes == 0) ? 0 : (bytes.bitLength - 1) ~/ 10;
    final size = bytes / (1 << (unitIndex * 10));

    return '${size.toStringAsFixed(decimals)} ${units[unitIndex]}';
  }

  /// Checks if file exists
  ///
  /// [filePath] The file path to check
  ///
  /// Returns true if the file exists
  ///
  /// Example:
  /// ```dart
  /// final exists = QFileInfoUtils.fileExists('/path/to/file.txt'); // true
  /// ```
  static bool fileExists(String filePath) {
    try {
      return File(filePath).existsSync();
    } catch (_) {
      return false;
    }
  }

  /// Gets file modification time
  ///
  /// [filePath] The file path to check
  ///
  /// Returns the last modified time or null if file doesn't exist or error occurs
  ///
  /// Example:
  /// ```dart
  /// final modified = QFileInfoUtils.getModificationTime('/path/to/file.txt');
  /// ```
  static DateTime? getModificationTime(String filePath) {
    try {
      final file = File(filePath);
      if (file.existsSync()) {
        return file.lastModifiedSync();
      }
    } catch (_) {}
    return null;
  }

  /// Gets file creation time (may not be available on all platforms)
  ///
  /// [filePath] The file path to check
  ///
  /// Returns the creation time or null if file doesn't exist or error occurs
  ///
  /// Example:
  /// ```dart
  /// final created = QFileInfoUtils.getCreationTime('/path/to/file.txt');
  /// ```
  static DateTime? getCreationTime(String filePath) {
    try {
      final file = File(filePath);
      if (file.existsSync()) {
        final stat = file.statSync();
        return stat.changed;
      }
    } catch (_) {}
    return null;
  }

  /// Validates if the file path has a valid format
  ///
  /// [filePath] The file path to validate
  ///
  /// Returns true if the file path is valid
  ///
  /// Example:
  /// ```dart
  /// final isValid = QFileInfoUtils.isValidPath('/path/to/file.txt'); // true
  /// ```
  static bool isValidPath(String filePath) {
    if (filePath.isEmpty) return false;

    // Check for invalid characters
    final invalidChars = RegExp(r'[<>:"|?*]');
    if (invalidChars.hasMatch(filePath)) return false;

    // Check for reserved names on Windows
    final reservedNames = [
      'CON',
      'PRN',
      'AUX',
      'NUL',
      'COM1',
      'COM2',
      'COM3',
      'COM4',
      'COM5',
      'COM6',
      'COM7',
      'COM8',
      'COM9',
      'LPT1',
      'LPT2',
      'LPT3',
      'LPT4',
      'LPT5',
      'LPT6',
      'LPT7',
      'LPT8',
      'LPT9',
    ];
    final fileName = getFileName(filePath)?.toUpperCase();
    if (fileName != null && reservedNames.contains(fileName)) return false;

    return true;
  }

  /// Sanitizes a filename by removing invalid characters
  ///
  /// [fileName] The filename to sanitize
  /// [replacement] The character to replace invalid characters with (defaults to '_')
  ///
  /// Returns a sanitized filename safe for most file systems
  ///
  /// Example:
  /// ```dart
  /// final safe = QFileInfoUtils.sanitizeFileName('file<name>?.txt'); // 'file_name__.txt'
  /// ```
  static String sanitizeFileName(String fileName, {String replacement = '_'}) {
    if (fileName.isEmpty) return fileName;

    // Replace invalid characters with the replacement character
    final sanitized = fileName.replaceAll(RegExp(r'[<>:"/\\|?*]'), replacement);

    // Remove leading/trailing dots and spaces
    return sanitized.replaceAll(RegExp(r'^[.\s]+|[.\s]+$'), '');
  }

  /// Generates a unique filename if the file already exists
  ///
  /// [basePath] The base path for the file
  /// [fileName] The desired file name
  ///
  /// Returns a unique file name by appending a counter if necessary
  ///
  /// Example:
  /// ```dart
  /// final uniqueName = QFileInfoUtils.generateUniqueFileName('/path/to', 'file.txt');
  /// ```
  static String generateUniqueFileName(String basePath, String fileName) {
    final dir = getDirectory(basePath) ?? '';
    final baseName = getBaseName(fileName) ?? '';
    final ext = getExtension(fileName, includeDot: true) ?? '';

    String uniqueName = fileName;
    int counter = 1;

    while (fileExists(path.join(dir, uniqueName))) {
      uniqueName = '$baseName ($counter)$ext';
      counter++;
    }

    return uniqueName;
  }
}
