import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Color extensions for QUtils
extension QColorExtensions on Color {
  
  // ======================== COLOR ANALYSIS ========================
  
  /// Converts this color to a hexadecimal string
  /// 
  /// [includeAlpha] Whether to include the alpha channel (defaults to true)
  /// [includeHash] Whether to include the # prefix (defaults to true)
  /// 
  /// Returns a hex string representation of the color
  /// 
  /// Example:
  /// ```dart
  /// final color = Color(0xFFFF5722);
  /// print(color.toHex()); // #FFFF5722
  /// print(color.toHex(includeAlpha: false)); // #FF5722
  /// ```
  String toHex({bool includeAlpha = true, bool includeHash = true}) {
    final hash = includeHash ? '#' : '';
    if (includeAlpha) {
      return '$hash${((a * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0').toUpperCase()}'
             '${((r * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0').toUpperCase()}'
             '${((g * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0').toUpperCase()}'
             '${((b * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0').toUpperCase()}';
    } else {
      return '$hash${((r * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0').toUpperCase()}'
             '${((g * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0').toUpperCase()}'
             '${((b * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0').toUpperCase()}';
    }
  }
  
  /// Gets the RGB values as a list [r, g, b]
  /// 
  /// [r] Red component, [g] Green component, [b] Blue component.
///
  /// Example:
  /// ```dart
  /// final color = Color(0xFFFF5722);
  /// print(color.toRgbList()); // [255, 87, 34]
  /// ```
  List<int> toRgbList() => [(r * 255.0).round() & 0xff, (g * 255.0).round() & 0xff, (b * 255.0).round() & 0xff];

  /// Gets the RGBA values as a list [r, g, b, a]
  /// 
  /// [r] Red component, [g] Green component, [b] Blue component, [a] Alpha component.
///
  /// Example:
  /// ```dart
  /// final color = Color(0x80FF5722);
  /// print(color.toRgbaList()); // [255, 87, 34, 128]
  /// ```
  List<int> toRgbaList() => [(r * 255.0).round() & 0xff, (g * 255.0).round() & 0xff, (b * 255.0).round() & 0xff, (a * 255.0).round() & 0xff];

  /// Gets the brightness of this color (0.0 to 1.0)
  double get brightness {
    return (((r * 255.0).round() & 0xff) * 0.299 + ((g * 255.0).round() & 0xff) * 0.587 + ((b * 255.0).round() & 0xff) * 0.114) / 255.0;
  }

  /// Checks if this color is light (brightness > 0.5)
  bool get isLight => brightness > 0.5;

  /// Checks if this color is dark (brightness <= 0.5)
  bool get isDark => brightness <= 0.5;

  /// Gets the luminance of this color
  double get luminance => computeLuminance();
  
  // ======================== COLOR MANIPULATION ========================
  
  /// Lightens this color by the given amount (0.0 to 1.0)
  Color lighten(double amount) {
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
  
  /// Darkens this color by the given amount (0.0 to 1.0)
  Color darken(double amount) {
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }
  
  /// Saturates this color by the given amount (0.0 to 1.0)
  Color saturate(double amount) {
    final hsl = HSLColor.fromColor(this);
    final saturation = (hsl.saturation + amount).clamp(0.0, 1.0);
    return hsl.withSaturation(saturation).toColor();
  }
  
  /// Desaturates this color by the given amount (0.0 to 1.0)
  Color desaturate(double amount) {
    final hsl = HSLColor.fromColor(this);
    final saturation = (hsl.saturation - amount).clamp(0.0, 1.0);
    return hsl.withSaturation(saturation).toColor();
  }
  
  /// Gets the complementary color
  Color complement() {
    final hsl = HSLColor.fromColor(this);
    final complementaryHue = (hsl.hue + 180) % 360;
    return hsl.withHue(complementaryHue).toColor();
  }
  
  /// Blends this color with another color
  Color blend(Color other, double ratio) {
    return Color.lerp(this, other, ratio.clamp(0.0, 1.0)) ?? this;
  }
  
  /// Creates a monochromatic color scheme
  List<Color> get monochromaticScheme {
    return [
      lighten(0.4),
      lighten(0.2),
      this,
      darken(0.2),
      darken(0.4),
    ];
  }
  
  /// Creates an analogous color scheme
  List<Color> get analogousScheme {
    final hsl = HSLColor.fromColor(this);
    return [
      hsl.withHue((hsl.hue - 30) % 360).toColor(),
      hsl.withHue((hsl.hue - 15) % 360).toColor(),
      this,
      hsl.withHue((hsl.hue + 15) % 360).toColor(),
      hsl.withHue((hsl.hue + 30) % 360).toColor(),
    ];
  }
  
  /// Creates a triadic color scheme
  List<Color> get triadicScheme {
    final hsl = HSLColor.fromColor(this);
    return [
      this,
      hsl.withHue((hsl.hue + 120) % 360).toColor(),
      hsl.withHue((hsl.hue + 240) % 360).toColor(),
    ];
  }



  /// Mix this color with another color
  Color mix(Color other, double ratio) {
    return Color.lerp(this, other, ratio.clamp(0.0, 1.0)) ?? this;
  }

  /// Gets analogous colors
  List<Color> analogous({int count = 5}) {
    return analogousScheme;
  }

  /// Gets triadic colors
  List<Color> triadic() {
    return triadicScheme;
  }

  /// Gets monochromatic colors
  List<Color> monochromatic({int count = 5}) {
    return monochromaticScheme;
  }

  /// Gets contrasting text color (black or white)
  Color contrastingTextColor() {
    return isLight ? Colors.black : Colors.white;
  }

  /// Calculates contrast ratio with another color
  double contrastRatio(Color other) {
    final l1 = computeLuminance();
    final l2 = other.computeLuminance();
    final lighter = math.max(l1, l2);
    final darker = math.min(l1, l2);
    return (lighter + 0.05) / (darker + 0.05);
  }
}
