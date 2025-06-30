import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Comprehensive color collection for QUtils
class QColors {
  // ======================== BASIC COLORS ========================
  
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFFF0000);
  static const Color green = Color(0xFF00FF00);
  static const Color blue = Color(0xFF0000FF);
  static const Color yellow = Color(0xFFFFFF00);
  static const Color cyan = Color(0xFF00FFFF);
  static const Color magenta = Color(0xFFFF00FF);
  
  // ======================== GRAY SCALE ========================
  
  static const Color lightGray = Color(0xFFD3D3D3);
  static const Color gray = Color(0xFF808080);
  static const Color darkGray = Color(0xFF404040);
  static const Color veryLightGray = Color(0xFFF5F5F5);
  static const Color veryDarkGray = Color(0xFF202020);
  static const Color silver = Color(0xFFC0C0C0);
  
  // ======================== VIBRANT COLORS ========================
  
  static const Color hotPink = Color(0xFFFF69B4);
  static const Color electricBlue = Color(0xFF0080FF);
  static const Color limeGreen = Color(0xFF32CD32);
  static const Color warmOrange = Color(0xFFFF8C00);
  static const Color deepPurple = Color(0xFF663399);
  static const Color brightYellow = Color(0xFFFFD700);
  static const Color neonGreen = Color(0xFF39FF14);
  static const Color crimsonRed = Color(0xFFDC143C);

  // ======================== PASTEL COLORS ========================

  static const Color pastelPink = Color(0xFFFFB6C1);
  static const Color pastelBlue = Color(0xFFADD8E6);
  static const Color pastelGreen = Color(0xFF90EE90);
  static const Color pastelYellow = Color(0xFFFFFACD);
  static const Color pastelPurple = Color(0xFFDDA0DD);
  static const Color pastelOrange = Color(0xFFFFDAB9);
  static const Color pastelMint = Color(0xFFF5FFFA);
  static const Color pastelLavender = Color(0xFFE6E6FA);

  // ======================== BRAND-INSPIRED COLORS ========================

  static const Color facebookBlue = Color(0xFF1877F2);
  static const Color twitterBlue = Color(0xFF1DA1F2);
  static const Color instagramPurple = Color(0xFFE4405F);
  static const Color whatsappGreen = Color(0xFF25D366);
  static const Color youtubeRed = Color(0xFFFF0000);
  static const Color linkedinBlue = Color(0xFF0077B5);
  static const Color githubBlack = Color(0xFF171515);
  static const Color googleRed = Color(0xFFDB4437);

  // ======================== NATURE-INSPIRED COLORS ========================

  static const Color forestGreen = Color(0xFF228B22);
  static const Color oceanBlue = Color(0xFF006994);
  static const Color sunsetOrange = Color(0xFFFF4500);
  static const Color skyBlue = Color(0xFF87CEEB);
  static const Color earthBrown = Color(0xFF8B4513);
  static const Color lavenderField = Color(0xFF9370DB);

  // ======================== DARK COLORS ========================
  
  static const Color darkBlue = Color(0xFF001F3F);
  static const Color darkGreen = Color(0xFF2D5016);
  static const Color darkRed = Color(0xFF8B0000);
  static const Color darkPurple = Color(0xFF4B0082);
  static const Color charcoal = Color(0xFF36454F);
  static const Color midnight = Color(0xFF191970);

  // ======================== COLOR COLLECTIONS ========================
  
  /// All colors in the collection
  static List<Color> get allColors => [
    // Basic
    white, black, red, green, blue, yellow, cyan, magenta,
    // Gray scale
    lightGray, gray, darkGray, veryLightGray, veryDarkGray, silver,
    // Vibrant
    hotPink, electricBlue, limeGreen, warmOrange, deepPurple, brightYellow, neonGreen, crimsonRed,
    // Pastel
    pastelPink, pastelBlue, pastelGreen, pastelYellow, pastelPurple, pastelOrange, pastelMint, pastelLavender,
    // Brand-inspired
    facebookBlue, twitterBlue, instagramPurple, whatsappGreen, youtubeRed, linkedinBlue, githubBlack, googleRed,
    // Nature-inspired
    forestGreen, oceanBlue, sunsetOrange, skyBlue, earthBrown, lavenderField,
    // Dark
    darkBlue, darkGreen, darkRed, darkPurple, charcoal, midnight,
  ];
  
  /// Vibrant colors collection
  static List<Color> get vibrantColors => [
    hotPink, electricBlue, limeGreen, warmOrange, deepPurple, brightYellow, neonGreen, crimsonRed,
  ];
  
  /// Pastel colors collection
  static List<Color> get pastelColors => [
    pastelPink, pastelBlue, pastelGreen, pastelYellow, pastelPurple, pastelOrange, pastelMint, pastelLavender,
  ];
  
  /// Brand colors collection
  static List<Color> get brandColors => [
    facebookBlue, twitterBlue, instagramPurple, whatsappGreen, youtubeRed, linkedinBlue, githubBlack, googleRed,
  ];
  
  /// Nature colors collection
  static List<Color> get natureColors => [
    forestGreen, oceanBlue, sunsetOrange, skyBlue, earthBrown, lavenderField,
  ];
  
  /// Dark colors collection
  static List<Color> get darkColors => [
    darkBlue, darkGreen, darkRed, darkPurple, charcoal, midnight,
  ];
  
  /// Gray scale colors collection
  static List<Color> get grayColors => [
    white, veryLightGray, lightGray, silver, gray, darkGray, veryDarkGray, black,
  ];
  
  /// Basic colors collection
  static List<Color> get basicColors => [
    white, black, red, green, blue, yellow, cyan, magenta,
  ];

  // ======================== UTILITY METHODS ========================

  /// Returns a random color from the collection
  static Color random() {
    final random = math.Random();
    return allColors[random.nextInt(allColors.length)];
  }

  /// Returns a random vibrant color
  static Color randomVibrant() {
    final random = math.Random();
    return vibrantColors[random.nextInt(vibrantColors.length)];
  }

  /// Returns a random pastel color
  static Color randomPastel() {
    final random = math.Random();
    return pastelColors[random.nextInt(pastelColors.length)];
  }

  /// Returns a random dark color
  static Color randomDark() {
    final random = math.Random();
    return darkColors[random.nextInt(darkColors.length)];
  }

  /// Gets a color by name (case insensitive)
  static Color? getByName(String name, [Color? fallback]) {
    final lowerName = name.toLowerCase().replaceAll(' ', '').replaceAll('_', '').replaceAll('-', '');

    final colorMap = <String, Color>{
      'white': white,
      'black': black,
      'red': red,
      'green': green,
      'blue': blue,
      'yellow': yellow,
      'cyan': cyan,
      'magenta': magenta,
      'lightgray': lightGray,
      'gray': gray,
      'grey': gray,
      'darkgray': darkGray,
      'hotpink': hotPink,
      'electricblue': electricBlue,
      'limegreen': limeGreen,
      'warmorange': warmOrange,
      'deeppurple': deepPurple,
      'pastelblue': pastelBlue,
      'pastelgreen': pastelGreen,
      'pastelpink': pastelPink,
    };

    return colorMap[lowerName] ?? fallback;
  }

  /// Creates a color palette based on a base color
  static List<Color> createPalette(Color baseColor, {int count = 5}) {
    final palette = <Color>[];
    final hsl = HSLColor.fromColor(baseColor);

    for (int i = 0; i < count; i++) {
      final lightness = (i / (count - 1)).clamp(0.2, 0.9);
      final color = hsl.withLightness(lightness).toColor();
      palette.add(color);
    }

    return palette;
  }

  /// Creates a gradient from a list of colors
  static LinearGradient createGradient(List<Color> colors, {
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    List<double>? stops,
  }) {
    return LinearGradient(
      begin: begin,
      end: end,
      colors: colors,
      stops: stops,
    );
  }

  /// Gets complementary color
  static Color getComplementary(Color color) {
    final hsl = HSLColor.fromColor(color);
    final complementaryHue = (hsl.hue + 180) % 360;
    return hsl.withHue(complementaryHue).toColor();
  }
  
  /// Gets analogous colors
  static List<Color> getAnalogous(Color color, {int count = 3}) {
    final hsl = HSLColor.fromColor(color);
    final colors = <Color>[];

    for (int i = 0; i < count; i++) {
      final hue = (hsl.hue + (i * 30)) % 360;
      colors.add(hsl.withHue(hue).toColor());
    }

    return colors;
  }
}
