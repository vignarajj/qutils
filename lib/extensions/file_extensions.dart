import 'dart:io';
import '../src/file_info_utils.dart';

/// File extensions for QUtils
///
/// Provides convenient extension methods on File objects for getting
/// file information, size, and other file-related utilities.
extension QFileExtensions on File {
  /// Gets the file extension (without dot)
  ///
  /// Returns the file extension or null if not found.
  /// Uses QFileInfoUtils.getExtension(path) with the dot excluded.
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/document.pdf');
  /// print(file.extension); // "pdf"
  /// print(file.extensionWithDot); // ".pdf"
  /// ```
  String? get extension => QFileInfoUtils.getExtension(path);

  /// Gets the file extension with dot
  ///
  /// Returns the file extension including the dot, or null if not found.
  /// Uses QFileInfoUtils.getExtension(path, includeDot: true).
  String? get extensionWithDot =>
      QFileInfoUtils.getExtension(path, includeDot: true);

  /// Gets the file name (including extension)
  ///
  /// Returns the filename or null if path is invalid
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/document.pdf');
  /// print(file.fileName); // "document.pdf"
  /// ```
  String? get fileName => QFileInfoUtils.getFileName(path);

  /// Gets the file name without extension
  ///
  /// Returns the base filename or null if path is invalid
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/document.pdf');
  /// print(file.baseName); // "document"
  /// ```
  String? get baseName => QFileInfoUtils.getBaseName(path);

  /// Gets the directory path
  ///
  /// Returns the directory path or null if path is invalid
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/document.pdf');
  /// print(file.directory); // "/path/to"
  /// ```
  String? get directoryPath => QFileInfoUtils.getDirectory(path);

  /// Gets the MIME type based on file extension
  ///
  /// Returns the MIME type or null if not determined
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/document.pdf');
  /// print(file.mimeType); // "application/pdf"
  /// ```
  String? get mimeType => QFileInfoUtils.getMimeType(path);

  /// Checks if this file is an image
  ///
  /// Returns true if the file is likely an image based on extension
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/photo.jpg');
  /// print(file.isImage); // true
  /// ```
  bool get isImageFile => QFileInfoUtils.isImage(path);

  /// Checks if this file is a video
  ///
  /// Returns true if the file is likely a video based on extension
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/movie.mp4');
  /// print(file.isVideo); // true
  /// ```
  bool get isVideoFile => QFileInfoUtils.isVideo(path);

  /// Checks if this file is an audio file
  ///
  /// Returns true if the file is likely an audio file based on extension
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/song.mp3');
  /// print(file.isAudio); // true
  /// ```
  bool get isAudioFile => QFileInfoUtils.isAudio(path);

  /// Checks if this file is a document
  ///
  /// Returns true if the file is likely a document based on extension
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/document.pdf');
  /// print(file.isDocument); // true
  /// ```
  bool get isDocumentFile => QFileInfoUtils.isDocument(path);

  /// Checks if this file is a spreadsheet
  ///
  /// Returns true if the file is likely a spreadsheet based on extension
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/spreadsheet.xlsx');
  /// print(file.isSpreadsheet); // true
  /// ```
  bool get isSpreadsheetFile => QFileInfoUtils.isSpreadsheet(path);

  /// Checks if this file is a presentation
  ///
  /// Returns true if the file is likely a presentation based on extension
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/presentation.pptx');
  /// print(file.isPresentation); // true
  /// ```
  bool get isPresentationFile => QFileInfoUtils.isPresentation(path);

  /// Checks if this file is an archive
  ///
  /// Returns true if the file is likely an archive based on extension
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/archive.zip');
  /// print(file.isArchive); // true
  /// ```
  bool get isArchiveFile => QFileInfoUtils.isArchive(path);

  /// Checks if this file is a code file
  ///
  /// Returns true if the file is likely a code file based on extension
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/script.dart');
  /// print(file.isCode); // true
  /// ```
  bool get isCodeFile => QFileInfoUtils.isCode(path);

  /// Gets the file category
  ///
  /// Returns the file category or null if not determined
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/document.pdf');
  /// print(file.fileCategory); // "document"
  /// ```
  String? get fileCategory => QFileInfoUtils.getFileCategory(path);

  /// Gets human-readable file size
  ///
  /// Returns the file size as a string (e.g., "1.5 MB") or null if error occurs
  ///
  /// Example:
  /// ```dart
  /// final file = File('/path/to/document.pdf');
  /// print(file.humanSize); // "1.50 MB" (or null)
  /// ```
  String? get humanSize => QFileInfoUtils.getHumanFileSize(path);
}

/// String extensions for file paths
///
/// Provides convenient extension methods on String paths for getting
/// file information without creating File objects.
extension QPathExtensions on String {
  /// Gets the file extension from this path (without dot)
  ///
  /// Returns the file extension or null if not found
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/document.pdf'.fileExtension); // "pdf"
  /// print('/path/to/document.pdf'.fileExtensionWithDot); // ".pdf"
  /// ```
  String? get fileExtension => QFileInfoUtils.getExtension(this);

  /// Gets the file extension with dot
  ///
  /// Returns the file extension including the dot, or null if not found.
  /// Uses QFileInfoUtils.getExtension(this, includeDot: true).
  String? get fileExtensionWithDot =>
      QFileInfoUtils.getExtension(this, includeDot: true);

  /// Gets the file name from this path (including extension)
  ///
  /// Returns the filename or null if path is invalid
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/document.pdf'.fileName); // "document.pdf"
  /// ```
  String? get fileName => QFileInfoUtils.getFileName(this);

  /// Gets the file name without extension from this path
  ///
  /// Returns the base filename or null if path is invalid
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/document.pdf'.fileBaseName); // "document"
  /// ```
  String? get fileBaseName => QFileInfoUtils.getBaseName(this);

  /// Gets the directory path from this file path
  ///
  /// Returns the directory path or null if path is invalid
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/document.pdf'.directoryPath); // "/path/to"
  /// ```
  String? get fileDirectory => QFileInfoUtils.getDirectory(this);

  /// Gets the MIME type for this file path based on extension
  ///
  /// Returns the MIME type or null if not determined
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/document.pdf'.mimeType); // "application/pdf"
  /// ```
  String? get fileMimeType => QFileInfoUtils.getMimeType(this);

  /// Checks if this file path represents an image
  ///
  /// Returns true if the file is likely an image based on extension
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/photo.jpg'.isImageFile); // true
  /// ```
  bool get isImageFile => QFileInfoUtils.isImage(this);

  /// Checks if this file path represents a video
  ///
  /// Returns true if the file is likely a video based on extension
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/movie.mp4'.isVideoFile); // true
  /// ```
  bool get isVideoFile => QFileInfoUtils.isVideo(this);

  /// Checks if this file path represents an audio file
  ///
  /// Returns true if the file is likely an audio file based on extension
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/song.mp3'.isAudioFile); // true
  /// ```
  bool get isAudioFile => QFileInfoUtils.isAudio(this);

  /// Checks if this file path represents a document
  ///
  /// Returns true if the file is likely a document based on extension
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/document.pdf'.isDocumentFile); // true
  /// ```
  bool get isDocumentFile => QFileInfoUtils.isDocument(this);

  /// Checks if this file path represents a spreadsheet
  ///
  /// Returns true if the file is likely a spreadsheet based on extension
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/spreadsheet.xlsx'.isSpreadsheetFile); // true
  /// ```
  bool get isSpreadsheetFile => QFileInfoUtils.isSpreadsheet(this);

  /// Checks if this file path represents a presentation
  ///
  /// Returns true if the file is likely a presentation based on extension
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/presentation.pptx'.isPresentationFile); // true
  /// ```
  bool get isPresentationFile => QFileInfoUtils.isPresentation(this);

  /// Checks if this file path represents an archive
  ///
  /// Returns true if the file is likely an archive based on extension
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/archive.zip'.isArchiveFile); // true
  /// ```
  bool get isArchiveFile => QFileInfoUtils.isArchive(this);

  /// Checks if this file path represents a code file
  ///
  /// Returns true if the file is likely a code file based on extension
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/script.dart'.isCodeFile); // true
  /// ```
  bool get isCodeFile => QFileInfoUtils.isCode(this);

  /// Gets the file category
  ///
  /// Returns the file category or null if not determined
  ///
  /// Example:
  /// ```dart
  /// final info = await '/path/to/document.pdf'.getFileInfo();
  /// print(info?['fileName']); // "document.pdf"
  /// print(info?['extension']); // "pdf"
  /// print(info?['mimeType']); // "application/pdf"
  /// ```
  String? get fileCategory => QFileInfoUtils.getFileCategory(this);

  /// Checks if the file exists
  ///
  /// Returns true if the file exists at this path
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/document.pdf'.fileExists); // true or false
  /// ```
  bool get fileExists => QFileInfoUtils.fileExists(this);

  /// Gets file size in bytes
  ///
  /// Returns the file size in bytes or null if file doesn't exist or error occurs
  ///
  /// Example:
  /// ```dart
  /// final size = await '/path/to/document.pdf'.fileSize();
  /// print(size); // 1024 (or null)
  /// ```
  int? get fileSize => QFileInfoUtils.getFileSize(this);

  /// Gets human-readable file size
  ///
  /// Returns the file size as a string (e.g., "1.5 MB") or null if error occurs
  ///
  /// Example:
  /// ```dart
  /// final size = await '/path/to/document.pdf'.fileHumanSize();
  /// print(size); // "1.50 MB" (or null)
  /// ```
  String? get fileHumanSize => QFileInfoUtils.getHumanFileSize(this);

  /// Validates if this is a valid file path
  ///
  /// Returns true if the path is valid and points to an existing file
  ///
  /// Example:
  /// ```dart
  /// print('/path/to/document.pdf'.isValidFilePath); // true or false
  /// ```
  bool get isValidFilePath => QFileInfoUtils.isValidPath(this);

  /// Sanitizes this filename
  ///
  /// [replacement] Character to replace invalid characters with (defaults to '_')
  ///
  /// Returns a sanitized filename
  ///
  /// Example:
  /// ```dart
  /// final sanitized = 'file<name>?.txt'.sanitizeFileName();
  /// print(sanitized); // 'file_name__.txt'
  /// ```
  String get sanitizedFileName => QFileInfoUtils.sanitizeFileName(this);

  /// Creates a sanitized version of this file path
  ///
  /// [replacement] Character to replace invalid characters with (defaults to '_')
  ///
  /// Returns a sanitized file path
  ///
  /// Example:
  /// ```dart
  /// final sanitized = '/path/to/file<name>?.txt'.sanitizeFilePath();
  /// print(sanitized); // '/path/to/file_name__.txt'
  /// ```
  String sanitizeFilePath({String replacement = '_'}) {
    final fileName = this.fileName;
    if (fileName == null) return this;

    final sanitizedName = QFileInfoUtils.sanitizeFileName(
      fileName,
      replacement: replacement,
    );
    final directory = fileDirectory ?? '';

    return directory.isEmpty ? sanitizedName : '$directory/$sanitizedName';
  }

  /// Converts this path to a File object
  ///
  /// Returns a File object for this path
  ///
  /// Example:
  /// ```dart
  /// final file = '/path/to/document.pdf'.toFile();
  /// ```
  File toFile() => File(this);
}
