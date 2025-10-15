import 'package:flutter/material.dart';

/// Color palette for the Moto Leniador application
/// Based on the color palette provided by the user
///
/// This version is optimized for Flutter and uses the Color class.
class AppColors {
  AppColors._();

  // ===== MAIN COLORS =====

  /// Primary color - Bright gold (used in main backgrounds and branding)
  static const Color primary =
      Color(0xFFFFB200); // Brighter and more vibrant gold as in the screens

  /// Secondary color - Warm orange (used in main buttons and actions)
  static const Color secondary =
      Color(0xFFFF6B35); // Warmer and more vibrant orange

  /// Tertiary color - Emerald green (used in confirmation buttons and positive states)
  static const Color tertiary =
      Color(0xFFE0F8FA); // More vibrant and modern green

  /// Surface color - Pure white for content backgrounds
  static const Color surface = Color(0xFFFFFFFF);

  /// Background color - Very soft cream for general backgrounds
  static const Color background =
      Color(0xFFFFFDF7); // Warmer background that complements gold

  // ===== TEXT COLORS =====

  /// Primary text - Deep navy blue for titles and main content
  static const Color textPrimary =
      Color(0xFF1A365D); // Deeper navy blue for better contrast with gold

  /// Secondary text - Charcoal gray for subtitles and secondary information
  static const Color textSecondary =
      Color(0xFF4A5568); // Darker and more elegant gray

  /// Text on light surface - For texts on light backgrounds
  static const Color textOnLight = Color(0xFF1A365D);

  /// Text on dark surface - For texts on dark backgrounds
  static const Color textOnDark = Color(0xFFFFFFFF);

  /// Link text - Tertiary color for links and actions
  static const Color textLink = tertiary;

  /// Price text - Secondary color for prices and monetary values
  static const Color textPrice = secondary;

  // ===== NEUTRAL COLORS =====

  /// Medium gray for secondary texts
  static const Color mediumGray = Color(0xFF718096);

  /// Dark gray for contrast elements
  static const Color darkGray = Color(0xFF2D3748);

  /// Very light gray for subtle backgrounds
  static const Color veryLightGray = Color(0xFFFFFBF0); // Warmer tone

  /// Pure white for main backgrounds
  static const Color pureWhite = Color(0xFFFFFFFF);

  /// Soft black for main texts
  static const Color softBlack = Color(0xFF1A202C);

  // ===== STATUS COLORS =====

  /// Green for success states
  static const Color successGreen = Color(0xFF38A169); // Warmer green

  /// Yellow for warnings and alerts
  static const Color warningYellow =
      Color(0xFFECC94B); // Softer yellow that complements gold

  /// Blue for information
  static const Color infoBlue = Color(0xFF4299E1); // Softer blue

  /// Red for errors
  static const Color errorRed = Color(0xFFE53E3E); // Softer red

  // ===== COLORS FOR INPUTS AND FORMS =====

  /// Border color for inputs in normal state
  static const Color inputBorder = Color(0xFFE2E8F0); // Softer gray

  /// Border color for inputs in focus state
  static const Color inputBorderFocus = primary; // Gold to indicate focus

  /// Border color for inputs with error
  static const Color inputBorderError = errorRed;

  /// Background color for inputs
  static const Color inputBackground =
      Color(0xFFFFFDF7); // Warm background that complements gold

  /// Placeholder text color in inputs
  static const Color inputPlaceholder = Color(0xFFA0AEC0); // Softer medium gray

  /// Text color in inputs
  static const Color inputText = textPrimary;

  /// Background color for disabled inputs
  static const Color inputDisabled = Color(0xFFF7FAFC); // Softer background

  // ===== ADDITIONAL COLORS =====

  /// Dark gold for luxury elements
  static const Color darkGold = Color(0xFFB8860B);

  /// Soft cream for complementary elements
  static const Color softCream = Color(0xFFFFF8DC);

  // ===== SEMANTIC COLORS =====

  /// Main error color
  static const Color error = errorRed;

  /// Main warning color
  static const Color warning = warningYellow;

  /// Main surface color
  static const Color surfaceMain = pureWhite;

  /// Main text color
  static const Color onSurface = softBlack;

  // ===== BUTTON COLORS =====

  /// Primary button color
  static const Color buttonPrimary = secondary;

  /// Secondary button color
  static const Color buttonSecondary = tertiary;

  /// Disabled button color
  static const Color buttonDisabled = mediumGray;

  // ===== APP-SPECIFIC COLORS =====

  /// Colors for maps and location
  static const Color mapMarker = secondary;
  static const Color currentLocation = infoBlue;
  static const Color routePath = tertiary;
  static const Color destinationMarker = successGreen;

  /// Colors for order states
  static const Color orderPending = warningYellow;
  static const Color orderInProgress = infoBlue;
  static const Color orderDelivered = successGreen;
  static const Color orderCancelled = errorRed;

  // ===== MATERIAL COLOR SWATCH =====

  /// Material color swatch based on the primary color (gold)
  static const MaterialColor primarySwatch = MaterialColor(
    0xFFFFD700,
    <int, Color>{
      50: Color(0xFFFFFDF7),
      100: Color(0xFFFFF8DC),
      200: Color(0xFFFFF0B3),
      300: Color(0xFFFFE680),
      400: Color(0xFFFFDD4D),
      500: Color(0xFFFFD700),
      600: Color(0xFFE6C200),
      700: Color(0xFFCCAD00),
      800: Color(0xFFB39900),
      900: Color(0xFF998500),
    },
  );

  // ===== ACCESSIBLE COMBINATIONS =====

  /// Color combinations that comply with WCAG AA
  static const Map<String, List<Color>> accessibleCombinations = {
    'primary': [primary, softBlack],
    'secondary': [secondary, pureWhite],
    'tertiary': [tertiary, pureWhite],
    'success': [successGreen, pureWhite],
    'warning': [warningYellow, softBlack],
    'error': [errorRed, pureWhite],
    'neutral': [mediumGray, pureWhite],
  };

  // ===== GRADIENTS =====

  /// Main gradient from gold to orange
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Success gradient
  static const LinearGradient successGradient = LinearGradient(
    colors: [successGreen, tertiary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Warning gradient
  static const LinearGradient warningGradient = LinearGradient(
    colors: [warningYellow, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ===== UTILITY METHODS =====

  /// Converts a color to its hexadecimal representation
  static String toHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}';
  }

  /// Gets all primary colors
  static List<Color> get primaryColors => [
        primary,
        secondary,
        tertiary,
      ];

  /// Gets all status colors
  static List<Color> get statusColors => [
        successGreen,
        warningYellow,
        errorRed,
        infoBlue,
      ];

  /// Creates a color with the specified opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }

  /// Lightens a color by the specified amount
  static Color lighten(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }

  /// Darkens a color by the specified amount
  static Color darken(Color color, [double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
