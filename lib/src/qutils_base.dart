// TODO: Put public facing types in this file.

/// Log levels for QLogger
enum LogLevel {
  debug,
  info,
  warning,
  error,
  fatal,
}

/// ANSI color codes for terminal output
class AnsiColor {
  final String _code;

  const AnsiColor._(this._code);

  // Basic colors
  static const AnsiColor black = AnsiColor._('\x1B[30m');
  static const AnsiColor red = AnsiColor._('\x1B[31m');
  static const AnsiColor green = AnsiColor._('\x1B[32m');
  static const AnsiColor yellow = AnsiColor._('\x1B[33m');
  static const AnsiColor blue = AnsiColor._('\x1B[34m');
  static const AnsiColor magenta = AnsiColor._('\x1B[35m');
  static const AnsiColor cyan = AnsiColor._('\x1B[36m');
  static const AnsiColor white = AnsiColor._('\x1B[37m');

  // Bright colors
  static const AnsiColor brightBlack = AnsiColor._('\x1B[90m');
  static const AnsiColor brightRed = AnsiColor._('\x1B[91m');
  static const AnsiColor brightGreen = AnsiColor._('\x1B[92m');
  static const AnsiColor brightYellow = AnsiColor._('\x1B[93m');
  static const AnsiColor brightBlue = AnsiColor._('\x1B[94m');
  static const AnsiColor brightMagenta = AnsiColor._('\x1B[95m');
  static const AnsiColor brightCyan = AnsiColor._('\x1B[96m');
  static const AnsiColor brightWhite = AnsiColor._('\x1B[97m');

  // Background colors
  static const AnsiColor bgBlack = AnsiColor._('\x1B[40m');
  static const AnsiColor bgRed = AnsiColor._('\x1B[41m');
  static const AnsiColor bgGreen = AnsiColor._('\x1B[42m');
  static const AnsiColor bgYellow = AnsiColor._('\x1B[43m');
  static const AnsiColor bgBlue = AnsiColor._('\x1B[44m');
  static const AnsiColor bgMagenta = AnsiColor._('\x1B[45m');
  static const AnsiColor bgCyan = AnsiColor._('\x1B[46m');
  static const AnsiColor bgWhite = AnsiColor._('\x1B[47m');

  // Styles
  static const AnsiColor bold = AnsiColor._('\x1B[1m');
  static const AnsiColor italic = AnsiColor._('\x1B[3m');
  static const AnsiColor underline = AnsiColor._('\x1B[4m');
  static const AnsiColor reset = AnsiColor._('\x1B[0m');

  /// Create an RGB color
  static AnsiColor rgb(int r, int g, int b) {
    return AnsiColor._('\x1B[38;2;$r;$g;${b}m');
  }

  /// Create an RGB background color
  static AnsiColor bgRgb(int r, int g, int b) {
    return AnsiColor._('\x1B[48;2;$r;$g;${b}m');
  }

  /// Combine multiple ANSI colors
  AnsiColor combine(AnsiColor other) {
    return AnsiColor._('$_code${other._code}');
  }

  /// Apply color to text
  String apply(String text) {
    return '$_code$text${AnsiColor.reset._code}';
  }

  @override
  String toString() => _code;
}

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}
