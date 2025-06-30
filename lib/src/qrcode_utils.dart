import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// QR Code validation result
class QRValidationResult {
  final bool isValid;
  final String? error;
  final int? estimatedVersion;
  final String? dataType;

  QRValidationResult({
    required this.isValid,
    this.error,
    this.estimatedVersion,
    this.dataType,
  });
}

/// Comprehensive QR Code utilities for QUtils
class QQRCodeUtils {

  /// Validates QR code data and provides recommendations
  static QRValidationResult validateQRData(String data) {
    if (data.isEmpty) {
      return QRValidationResult(
        isValid: false,
        error: 'Data cannot be empty',
      );
    }

    // Estimate data type
    String dataType = 'text';
    if (data.startsWith('http://') || data.startsWith('https://')) {
      dataType = 'url';
    } else if (data.startsWith('mailto:')) {
      dataType = 'email';
    } else if (data.startsWith('tel:')) {
      dataType = 'phone';
    } else if (data.startsWith('WIFI:')) {
      dataType = 'wifi';
    }

    // Estimate version based on data length
    int estimatedVersion = getOptimalVersion(data);

    return QRValidationResult(
      isValid: true,
      estimatedVersion: estimatedVersion,
      dataType: dataType,
    );
  }

  /// Gets the optimal QR code version for the given data
  static int getOptimalVersion(String data) {
    final length = data.length;

    // Simplified version estimation for alphanumeric mode
    if (length <= 25) return 1;
    if (length <= 47) return 2;
    if (length <= 77) return 3;
    if (length <= 114) return 4;
    if (length <= 154) return 5;
    if (length <= 195) return 6;
    if (length <= 224) return 7;
    if (length <= 279) return 8;
    if (length <= 335) return 9;
    if (length <= 395) return 10;

    // For longer data, estimate based on rough calculations
    return (length / 40).ceil().clamp(1, 40);
  }

  /// Creates a WiFi QR code string
  static String createWiFiQR(String ssid, String password, {
    String security = 'WPA',
    bool hidden = false,
  }) {
    return 'WIFI:T:$security;S:$ssid;P:$password;H:${hidden ? 'true' : 'false'};;';
  }

  /// Creates a URL QR code string
  static String createUrlQR(String url) {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = 'https://$url';
    }
    return url;
  }

  /// Creates an email QR code string
  static String createEmailQR(String email, {String? subject, String? body}) {
    var emailString = 'mailto:$email';
    final params = <String>[];

    if (subject != null && subject.isNotEmpty) {
      params.add('subject=${Uri.encodeComponent(subject)}');
    }
    if (body != null && body.isNotEmpty) {
      params.add('body=${Uri.encodeComponent(body)}');
    }

    if (params.isNotEmpty) {
      emailString += '?${params.join('&')}';
    }

    return emailString;
  }

  /// Creates a phone QR code string
  static String createPhoneQR(String phoneNumber) {
    return 'tel:$phoneNumber';
  }

  /// Creates an SMS QR code string
  static String createSMSQR(String phoneNumber, {String? message}) {
    var smsString = 'sms:$phoneNumber';
    if (message != null && message.isNotEmpty) {
      smsString += '?body=${Uri.encodeComponent(message)}';
    }
    return smsString;
  }

  /// Creates a contact (vCard) QR code string
  static String createContactQR({
    required String firstName,
    String? lastName,
    String? phone,
    String? email,
    String? organization,
    String? title,
    String? url,
  }) {
    final vcard = StringBuffer();
    vcard.writeln('BEGIN:VCARD');
    vcard.writeln('VERSION:3.0');

    final fullName = lastName != null ? '$firstName $lastName' : firstName;
    vcard.writeln('FN:$fullName');
    vcard.writeln('N:${lastName ?? ''};$firstName;;;');

    if (phone != null) vcard.writeln('TEL:$phone');
    if (email != null) vcard.writeln('EMAIL:$email');
    if (organization != null) vcard.writeln('ORG:$organization');
    if (title != null) vcard.writeln('TITLE:$title');
    if (url != null) vcard.writeln('URL:$url');

    vcard.write('END:VCARD');
    return vcard.toString();
  }

  /// Creates a QR code widget
  static Widget createQRWidget(
    String data, {
    double size = 200.0,
    Color foregroundColor = Colors.black,
    Color backgroundColor = Colors.white,
    int? version,
    bool gapless = false,
    EdgeInsets padding = const EdgeInsets.all(10.0),
    String? semanticsLabel,
  }) {
    return QrImageView(
      data: data,
      version: version ?? QrVersions.auto,
      size: size,
      gapless: gapless,
      padding: padding,
      backgroundColor: backgroundColor,
      semanticsLabel: semanticsLabel ?? 'QR Code',
    );
  }

  /// Creates a styled QR code widget with custom design
  static Widget createStyledQRWidget(
    String data, {
    double size = 200.0,
    Color foregroundColor = Colors.black,
    Color backgroundColor = Colors.white,
    Widget? embeddedImage,
    double embeddedImageSizePercent = 0.25,
    BorderRadius? borderRadius,
    EdgeInsets padding = const EdgeInsets.all(10.0),
    BoxShadow? shadow,
  }) {
    Widget qrWidget = QrImageView(
      data: data,
      version: QrVersions.auto,
      size: size,
      gapless: false,
      padding: padding,
      backgroundColor: backgroundColor,
      embeddedImage: null, // This would need actual image handling with proper asset path
      embeddedImageStyle: embeddedImage != null ?
        QrEmbeddedImageStyle(size: Size.square(size * embeddedImageSizePercent)) : null,
    );

    if (borderRadius != null || shadow != null) {
      qrWidget = Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: shadow != null ? [shadow] : null,
        ),
        child: ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: qrWidget,
        ),
      );
    }

    return qrWidget;
  }

  /// Parses WiFi QR code data
  static Map<String, String>? parseWiFiQR(String qrData) {
    if (!qrData.startsWith('WIFI:')) return null;

    final result = <String, String>{};
    final parts = qrData.substring(5).split(';');

    for (final part in parts) {
      if (part.isEmpty) continue;
      final keyValue = part.split(':');
      if (keyValue.length == 2) {
        switch (keyValue[0]) {
          case 'T':
            result['security'] = keyValue[1];
            break;
          case 'S':
            result['ssid'] = keyValue[1];
            break;
          case 'P':
            result['password'] = keyValue[1];
            break;
          case 'H':
            result['hidden'] = keyValue[1];
            break;
        }
      }
    }

    return result;
  }

  /// Gets QR code capacity for different data types
  static Map<String, int> getCapacity(int version, int errorLevel) {
    // Simplified capacity data for version 1, error level M
    // In a real implementation, this would have complete capacity tables
    final baseCapacity = {
      'numeric': 41,
      'alphanumeric': 25,
      'byte': 17,
      'kanji': 10,
    };

    // Scale based on version and error level (approximate)
    final scaleFactor = version * 1.5 * (1.0 - errorLevel * 0.1);
    return baseCapacity.map((key, value) =>
      MapEntry(key, (value * scaleFactor).round()));
  }
}
