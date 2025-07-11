import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  // Screen dimensions
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  // Orientation checks
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  // Device type checks (based on common responsive breakpoints)
  // - Mobile: width < 600
  // - Small Tablet: 600 <= width < 840
  // - Large Tablet: 840 <= width < 1200
  // - Desktop: width >= 1200
  bool get isMobile => screenWidth < 600;

  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;

  bool get isSmallTablet => screenWidth >= 600 && screenWidth < 840;

  bool get isLargeTablet => screenWidth >= 840 && screenWidth < 1200;

  bool get isDesktop => screenWidth >= 1200;

  // Font sizes (scaled based on screen width; can be adjusted as needed)
  double get smallFontSize => _scaleFont(12);

  double get mediumFontSize => _scaleFont(16);

  double get largeFontSize => _scaleFont(20);

  // Helper to scale font sizes responsively
  double _scaleFont(double baseSize) {
    if (isDesktop) return baseSize * 1.2;
    if (isLargeTablet) return baseSize * 1.1;
    if (isSmallTablet) return baseSize * 1.05;
    return baseSize; // Mobile default
  }

  // Default padding and margin (scaled based on screen size)
  double get defaultPadding => _scaleSpacing(16);

  double get defaultMargin => _scaleSpacing(16);

  // Helper to scale spacing responsively
  double _scaleSpacing(double baseSpacing) {
    if (isDesktop) return baseSpacing * 1.5;
    if (isLargeTablet) return baseSpacing * 1.3;
    if (isSmallTablet) return baseSpacing * 1.1;
    return baseSpacing; // Mobile default
  }

  // Whole app dimensions (examples; customize as per app needs)
  double get appBarHeight =>
      _scaleSpacing(56); // Standard app bar height, scaled
  double get bottomNavHeight =>
      _scaleSpacing(56); // Standard bottom nav height, scaled
  double get drawerWidth =>
      screenWidth * 0.8; // 80% of screen width for drawers
  double get maxContentWidth =>
      isDesktop ? 1200 : screenWidth; // Cap content width on large screens

  // Percentage-based widths/heights for responsive layouts
  double widthPercent(double percent) => screenWidth * (percent / 100);

  double heightPercent(double percent) => screenHeight * (percent / 100);

  // Safe area insets
  double get safePaddingTop => MediaQuery.of(this).padding.top;

  double get safePaddingBottom => MediaQuery.of(this).padding.bottom;

  double get safePaddingLeft => MediaQuery.of(this).padding.left;

  double get safePaddingRight => MediaQuery.of(this).padding.right;

  // Pixel density
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;
}
