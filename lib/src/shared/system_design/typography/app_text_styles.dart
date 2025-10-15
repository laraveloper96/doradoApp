import 'package:flutter/material.dart';

/// Text styles for the application following Material Design 3 guidelines
/// Provides a comprehensive set of text styles for different use cases
class AppTextStyles {
  // ===== FONT CONFIGURATION =====

  /// Main application font
  /// To change the font globally, modify this variable:
  /// - 'Inter' for a more modern look
  /// - 'Poppins' for better readability
  /// - 'Montserrat' for a more elegant style
  static const String _fontFamily = 'Roboto';

  // ===== DISPLAY STYLES (Main Titles) =====

  /// Main screen titles, splash screens
  /// Size: 57px, Weight: Regular (400)
  static const TextStyle displayLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w400,
    height: 1.12, // 64/57
    letterSpacing: -0.25,
  );

  /// Important section titles
  /// Size: 45px, Weight: Regular (400)
  static const TextStyle displayMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45,
    fontWeight: FontWeight.w400,
    height: 1.16, // 52/45
    letterSpacing: 0,
  );

  /// Main card titles
  /// Size: 36px, Weight: Regular (400)
  static const TextStyle displaySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    height: 1.22, // 44/36
    letterSpacing: 0,
  );

  // ===== HEADLINE STYLES (Page Titles) =====

  /// Page titles, main headers
  /// Size: 32px, Weight: Regular (400)
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.25, // 40/32
    letterSpacing: 0,
  );

  /// Important subtitles, service names
  /// Size: 28px, Weight: Regular (400)
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w400,
    height: 1.29, // 36/28
    letterSpacing: 0,
  );

  /// Section titles, categories
  /// Size: 24px, Weight: Regular (400)
  static const TextStyle headlineSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.33, // 32/24
    letterSpacing: 0,
  );

  // ===== TITLE STYLES (Medium Titles) =====

  /// Dialog titles, product/service names
  /// Size: 22px, Weight: Regular (400)
  static const TextStyle titleLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w400,
    height: 1.27, // 28/22
    letterSpacing: 0,
  );

  /// Subtitles, element names
  /// Size: 16px, Weight: Medium (500)
  static const TextStyle titleMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.50, // 24/16
    letterSpacing: 0.15,
  );

  /// Small component titles
  /// Size: 14px, Weight: Medium (500)
  static const TextStyle titleSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43, // 20/14
    letterSpacing: 0.1,
  );

  // ===== BODY STYLES (Body Text) =====

  /// Main text, important descriptions
  /// Size: 16px, Weight: Regular (400)
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.50, // 24/16
    letterSpacing: 0.5,
  );

  /// Standard text, general content
  /// Size: 14px, Weight: Regular (400)
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43, // 20/14
    letterSpacing: 0.25,
  );

  /// Secondary text, notes
  /// Size: 12px, Weight: Regular (400)
  static const TextStyle bodySmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33, // 16/12
    letterSpacing: 0.4,
  );

  // ===== LABEL STYLES (Labels) =====

  /// Main buttons, important labels
  /// Size: 14px, Weight: Medium (500)
  static const TextStyle labelLarge = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43, // 20/14
    letterSpacing: 0.1,
  );

  /// Secondary buttons, tabs
  /// Size: 12px, Weight: Medium (500)
  static const TextStyle labelMedium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33, // 16/12
    letterSpacing: 0.5,
  );

  /// Small labels, badges, chips
  /// Size: 11px, Weight: Medium (500)
  static const TextStyle labelSmall = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.45, // 16/11
    letterSpacing: 0.5,
  );

  // ===== MOTO LENIADOR SPECIFIC STYLES =====

  /// Style for displaying service prices
  static const TextStyle priceText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.22,
    letterSpacing: 0,
  );

  /// Style for estimated delivery time
  static const TextStyle deliveryTime = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.4,
  );

  /// Style for order status (pending, in progress, etc.)
  static const TextStyle orderStatus = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0.5,
  );

  /// Style for addresses and locations
  static const TextStyle addressText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
  );

  /// Style for driver/lumberjack names
  static const TextStyle driverName = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.50,
    letterSpacing: 0.15,
  );

  /// Style for ratings and reviews
  static const TextStyle ratingText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: 0.1,
  );

  /// Style for distances (e.g., "2.5 km")
  static const TextStyle distanceText = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  );

  /// Style for tracking codes
  static const TextStyle trackingCode = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 1,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  // ===== MÉTODOS UTILITARIOS =====

  /// Aplica una fuente personalizada a cualquier estilo
  static TextStyle withFontFamily(TextStyle style, String fontFamily) {
    return style.copyWith(fontFamily: fontFamily);
  }

  /// Aplica un color específico a cualquier estilo
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Aplica un peso de fuente específico
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }

  /// Aplica un tamaño de fuente específico
  static TextStyle withSize(TextStyle style, double size) {
    return style.copyWith(fontSize: size);
  }

  /// Combina múltiples modificaciones en un solo método
  static TextStyle customize(
    TextStyle style, {
    Color? color,
    FontWeight? weight,
    double? size,
    String? fontFamily,
    double? letterSpacing,
    double? height,
  }) {
    return style.copyWith(
      color: color,
      fontWeight: weight,
      fontSize: size,
      fontFamily: fontFamily,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}

/// Clase para manejo de tipografía responsive
class ResponsiveTextStyles {
  /// Calcula el factor de escala basado en el tamaño de pantalla
  static double getScaleFactor(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 360) return 0.9; // Pantallas pequeñas
    if (screenWidth > 600) return 1.1; // Tablets
    return 1; // Pantallas normales
  }

  /// Escala un estilo de texto según el tamaño de pantalla
  static TextStyle scaleTextStyle(TextStyle style, BuildContext context) {
    final scaleFactor = getScaleFactor(context);
    return style.copyWith(
      fontSize: (style.fontSize ?? 14) * scaleFactor,
    );
  }

  /// Obtiene un estilo escalado directamente
  static TextStyle getScaledStyle(TextStyle style, BuildContext context) {
    return scaleTextStyle(style, context);
  }
}

/// Configuración global de fuentes
class FontConfig {
  static String _currentFont = AppTextStyles._fontFamily;

  /// Obtiene la fuente actual
  static String get currentFont => _currentFont;

  /// Cambia la fuente globalmente (requiere rebuild de la app)
  static set currentFont(String newFont) {
    _currentFont = newFont;
  }

  /// Lista de fuentes disponibles
  static const List<String> availableFonts = [
    'Roboto',
    'Inter',
    'Poppins',
    'Montserrat',
    'Open Sans',
    'Lato',
  ];
}
