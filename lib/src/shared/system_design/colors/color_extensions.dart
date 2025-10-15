import 'package:currency_converter/src/shared/system_design/colors/app_colors.dart';
import 'package:flutter/material.dart';

/// Extensions for BuildContext that facilitate access to design system colors
/// from any widget.
extension ColorExtensions on BuildContext {
  /// Quick access to main colors
  AppColorsExtension get colors => AppColorsExtension();

  /// Access to current theme
  ThemeData get theme => Theme.of(this);

  /// Access to current theme's color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

/// Class that provides organized access to all design system colors
class AppColorsExtension {
  // ===== MAIN COLORS =====
  Color get primary => AppColors.primary;
  Color get secondary => AppColors.secondary;
  Color get tertiary => AppColors.tertiary;
  Color get surface => AppColors.surface;
  Color get background => AppColors.background;

  // ===== TEXT COLORS =====
  Color get textPrimary => AppColors.textPrimary;
  Color get textSecondary => AppColors.textSecondary;
  Color get textOnLight => AppColors.textOnLight;
  Color get textOnDark => AppColors.textOnDark;
  Color get textLink => AppColors.textLink;
  Color get textPrice => AppColors.textPrice;

  // ===== NEUTRAL COLORS =====
  Color get mediumGray => AppColors.mediumGray;
  Color get darkGray => AppColors.darkGray;
  Color get veryLightGray => AppColors.veryLightGray;
  Color get pureWhite => AppColors.pureWhite;
  Color get softBlack => AppColors.softBlack;

  // ===== STATE COLORS =====
  Color get success => AppColors.successGreen;
  Color get warning => AppColors.warningYellow;
  Color get info => AppColors.infoBlue;
  Color get error => AppColors.errorRed;

  // ===== INPUT COLORS =====
  Color get inputBorder => AppColors.inputBorder;
  Color get inputBorderFocus => AppColors.inputBorderFocus;
  Color get inputBorderError => AppColors.inputBorderError;
  Color get inputBackground => AppColors.inputBackground;
  Color get inputPlaceholder => AppColors.inputPlaceholder;
  Color get inputText => AppColors.inputText;
  Color get inputDisabled => AppColors.inputDisabled;

  // ===== BUTTON COLORS =====
  Color get buttonPrimary => AppColors.buttonPrimary;
  Color get buttonSecondary => AppColors.buttonSecondary;
  Color get buttonDisabled => AppColors.buttonDisabled;

  // ===== GRADIENTS =====
  LinearGradient get primaryGradient => AppColors.primaryGradient;
  LinearGradient get successGradient => AppColors.successGradient;
  LinearGradient get warningGradient => AppColors.warningGradient;
}

/// Extension for Color that adds additional utilities
extension ColorUtilities on Color {
  /// Converts color to hexadecimal string
  String get hex => AppColors.toHex(this);

  /// Gets a lighter version of the color
  Color lighten([double amount = 0.1]) => AppColors.lighten(this, amount);

  /// Gets a darker version of the color
  Color darken([double amount = 0.1]) => AppColors.darken(this, amount);

  /// Checks if the color is light (to determine appropriate text color)
  bool get isLight {
    final luminance = computeLuminance();
    return luminance > 0.5;
  }

  /// Gets the appropriate text color for this background
  Color get contrastingTextColor {
    return isLight ? AppColors.textOnLight : AppColors.textOnDark;
  }
}
