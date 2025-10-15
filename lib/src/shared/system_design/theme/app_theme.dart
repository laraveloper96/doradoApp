import 'package:currency_converter/src/shared/system_design/colors/app_colors.dart';
import 'package:currency_converter/src/shared/system_design/typography/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Main theme for the Moto Leniador application.
///
/// This class centralizes theme configuration and provides
/// predefined themes (light and dark) with all design system
/// components integrated.
class AppTheme {
  // ===== PRIVATE CONFIGURATION =====

  static const String _fontFamily = 'Roboto';

  // ===== MAIN THEMES =====

  /// Light theme for the application
  static ThemeData get lightTheme {
    return _buildTheme(
      brightness: Brightness.light,
      colorScheme: _lightColorScheme,
    );
  }

  /// Dark theme for the application
  static ThemeData get darkTheme {
    return _buildTheme(
      brightness: Brightness.dark,
      colorScheme: _darkColorScheme,
    );
  }

  // ===== COLOR SCHEMES =====

  /// Color scheme for light theme
  static ColorScheme get _lightColorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      surface: AppColors.surface,
      error: AppColors.errorRed,
      onPrimary: AppColors.textOnDark,
      onSecondary: AppColors.textOnDark,
      onTertiary: AppColors.textOnDark,
      onSurface: AppColors.textPrimary,
      onError: AppColors.textOnDark,
    );
  }

  /// Color scheme for dark theme
  static ColorScheme get _darkColorScheme {
    return ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      surface: AppColors.darkGray,
      error: AppColors.errorRed,
      onPrimary: AppColors.textOnDark,
      onSecondary: AppColors.textOnDark,
      onTertiary: AppColors.textOnDark,
      onSurface: AppColors.textOnLight,
      onError: AppColors.textOnDark,
    );
  }

  // ===== THEME CONSTRUCTION =====

  /// Builds a complete theme with the specified configuration
  static ThemeData _buildTheme({
    required Brightness brightness,
    required ColorScheme colorScheme,
  }) {
    final textTheme = _buildTextTheme(colorScheme);

    return ThemeData(
      // ===== BASIC CONFIGURATION =====
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      fontFamily: _fontFamily,

      // ===== TEXT THEME =====
      textTheme: textTheme,

      // ===== SCAFFOLD CONFIGURATION =====
      scaffoldBackgroundColor: colorScheme.surface,

      // ===== APP BAR CONFIGURATION =====
      appBarTheme: _buildAppBarTheme(colorScheme, textTheme),

      // ===== BUTTON CONFIGURATION =====
      elevatedButtonTheme: _buildElevatedButtonTheme(colorScheme),
      textButtonTheme: _buildTextButtonTheme(colorScheme),
      outlinedButtonTheme: _buildOutlinedButtonTheme(colorScheme),
      filledButtonTheme: _buildFilledButtonTheme(colorScheme),

      // ===== INPUT CONFIGURATION =====
      inputDecorationTheme: _buildInputDecorationTheme(colorScheme),

      // ===== CARD CONFIGURATION =====
      cardTheme: _buildCardTheme(colorScheme),

      // ===== DIALOG CONFIGURATION =====
      dialogTheme: _buildDialogTheme(colorScheme, textTheme),

      // ===== BOTTOM SHEET CONFIGURATION =====
      bottomSheetTheme: _buildBottomSheetTheme(colorScheme),

      // ===== NAVIGATION CONFIGURATION =====
      navigationBarTheme: _buildNavigationBarTheme(colorScheme),
      bottomNavigationBarTheme: _buildBottomNavigationBarTheme(colorScheme),

      // ===== CHIP CONFIGURATION =====
      chipTheme: _buildChipTheme(colorScheme),

      // ===== DIVIDER CONFIGURATION =====
      dividerTheme: _buildDividerTheme(colorScheme),

      // ===== FLOATING ACTION BUTTON CONFIGURATION =====
      floatingActionButtonTheme: _buildFABTheme(colorScheme),

      // ===== ICON CONFIGURATION =====
      iconTheme: _buildIconTheme(colorScheme),

      // ===== LIST TILE CONFIGURATION =====
      listTileTheme: _buildListTileTheme(colorScheme, textTheme),

      // ===== PROGRESS INDICATOR CONFIGURATION =====
      progressIndicatorTheme: _buildProgressIndicatorTheme(colorScheme),

      // ===== SWITCH AND CHECKBOX CONFIGURATION =====
      switchTheme: _buildSwitchTheme(colorScheme),
      checkboxTheme: _buildCheckboxTheme(colorScheme),
      radioTheme: _buildRadioTheme(colorScheme),

      // ===== TAB CONFIGURATION =====
      tabBarTheme: _buildTabBarTheme(colorScheme, textTheme),

      // ===== TOOLTIP CONFIGURATION =====
      tooltipTheme: _buildTooltipTheme(colorScheme, textTheme),
    );
  }

  // ===== SPECIFIC THEME CONSTRUCTION =====

  /// Builds text theme based on AppTextStyles
  static TextTheme _buildTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      // Display styles
      displayLarge: AppTextStyles.displayLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      displayMedium: AppTextStyles.displayMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      displaySmall: AppTextStyles.displaySmall.copyWith(
        color: colorScheme.onSurface,
      ),

      // Headline styles
      headlineLarge: AppTextStyles.headlineLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      headlineMedium: AppTextStyles.headlineMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(
        color: colorScheme.onSurface,
      ),

      // Title styles
      titleLarge: AppTextStyles.titleLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      titleMedium: AppTextStyles.titleMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      titleSmall: AppTextStyles.titleSmall.copyWith(
        color: colorScheme.onSurface,
      ),

      // Body styles
      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: colorScheme.onSurface.withOpacity(0.7),
      ),

      // Label styles
      labelLarge: AppTextStyles.labelLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      labelMedium: AppTextStyles.labelMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      labelSmall: AppTextStyles.labelSmall.copyWith(
        color: colorScheme.onSurface.withOpacity(0.8),
      ),
    );
  }

  /// Construye el tema de AppBar
  static AppBarTheme _buildAppBarTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: true,
      titleTextStyle: textTheme.titleLarge,
      toolbarTextStyle: textTheme.bodyMedium,
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      actionsIconTheme: IconThemeData(color: colorScheme.onSurface),
    );
  }

  /// Construye el tema de botones elevados
  static ElevatedButtonThemeData _buildElevatedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor: AppColors.buttonDisabled,
        disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        textStyle: AppTextStyles.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        minimumSize: const Size(64, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
      ),
    );
  }

  /// Construye el tema de botones de texto
  static TextButtonThemeData _buildTextButtonTheme(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        textStyle: AppTextStyles.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        minimumSize: const Size(64, 36),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Construye el tema de botones outlined
  static OutlinedButtonThemeData _buildOutlinedButtonTheme(
    ColorScheme colorScheme,
  ) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        textStyle: AppTextStyles.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        minimumSize: const Size(64, 40),
        side: BorderSide(color: colorScheme.outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Construye el tema de botones filled
  static FilledButtonThemeData _buildFilledButtonTheme(
    ColorScheme colorScheme,
  ) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        disabledBackgroundColor: colorScheme.onSurface.withOpacity(0.12),
        disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
        textStyle: AppTextStyles.labelLarge,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        minimumSize: const Size(64, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  /// Construye el tema de inputs
  static InputDecorationTheme _buildInputDecorationTheme(
    ColorScheme colorScheme,
  ) {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.inputBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.inputBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            const BorderSide(color: AppColors.inputBorderFocus, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.inputBorderError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            const BorderSide(color: AppColors.inputBorderError, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.inputDisabled),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.inputPlaceholder,
      ),
      labelStyle: AppTextStyles.bodyMedium.copyWith(
        color: colorScheme.onSurface,
      ),
      errorStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.errorRed,
      ),
    );
  }

  /// Construye el tema de tarjetas
  static CardTheme _buildCardTheme(ColorScheme colorScheme) {
    return CardTheme(
      color: colorScheme.surface,
      shadowColor: colorScheme.shadow,
      elevation: 2,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  /// Construye el tema de diálogos
  static DialogTheme _buildDialogTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return DialogTheme(
      backgroundColor: colorScheme.surface,
      titleTextStyle: textTheme.headlineSmall,
      contentTextStyle: textTheme.bodyMedium,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  /// Construye el tema de bottom sheet
  static BottomSheetThemeData _buildBottomSheetTheme(ColorScheme colorScheme) {
    return BottomSheetThemeData(
      backgroundColor: colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  /// Construye el tema de navigation bar
  static NavigationBarThemeData _buildNavigationBarTheme(
    ColorScheme colorScheme,
  ) {
    return NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      indicatorColor: colorScheme.primary.withOpacity(0.12),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppTextStyles.labelSmall.copyWith(color: colorScheme.primary);
        }
        return AppTextStyles.labelSmall.copyWith(
          color: colorScheme.onSurface.withOpacity(0.7),
        );
      }),
    );
  }

  /// Construye el tema de bottom navigation bar
  static BottomNavigationBarThemeData _buildBottomNavigationBarTheme(
    ColorScheme colorScheme,
  ) {
    return BottomNavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface.withOpacity(0.7),
      selectedLabelStyle: AppTextStyles.labelSmall,
      unselectedLabelStyle: AppTextStyles.labelSmall,
      type: BottomNavigationBarType.fixed,
    );
  }

  /// Construye el tema de chips
  static ChipThemeData _buildChipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      backgroundColor: colorScheme.surface,
      selectedColor: colorScheme.primary.withOpacity(0.12),
      disabledColor: colorScheme.onSurface.withOpacity(0.12),
      labelStyle: AppTextStyles.labelMedium,
      secondaryLabelStyle: AppTextStyles.labelMedium,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  /// Construye el tema de dividers
  static DividerThemeData _buildDividerTheme(ColorScheme colorScheme) {
    return DividerThemeData(
      color: colorScheme.outline.withOpacity(0.12),
      thickness: 1,
      space: 1,
    );
  }

  /// Construye el tema de FAB
  static FloatingActionButtonThemeData _buildFABTheme(ColorScheme colorScheme) {
    return FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  /// Construye el tema de iconos
  static IconThemeData _buildIconTheme(ColorScheme colorScheme) {
    return IconThemeData(
      color: colorScheme.onSurface,
      size: 24,
    );
  }

  /// Construye el tema de list tiles
  static ListTileThemeData _buildListTileTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      titleTextStyle: textTheme.bodyLarge,
      subtitleTextStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.7),
      ),
      leadingAndTrailingTextStyle: textTheme.labelMedium,
      iconColor: colorScheme.onSurface,
      textColor: colorScheme.onSurface,
    );
  }

  /// Construye el tema de progress indicators
  static ProgressIndicatorThemeData _buildProgressIndicatorTheme(
    ColorScheme colorScheme,
  ) {
    return ProgressIndicatorThemeData(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.primary.withOpacity(0.12),
      circularTrackColor: colorScheme.primary.withOpacity(0.12),
    );
  }

  /// Construye el tema de switches
  static SwitchThemeData _buildSwitchTheme(ColorScheme colorScheme) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.outline;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary.withOpacity(0.12);
        }
        return colorScheme.surfaceContainerHighest;
      }),
    );
  }

  /// Construye el tema de checkboxes
  static CheckboxThemeData _buildCheckboxTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
      side: BorderSide(color: colorScheme.outline),
    );
  }

  /// Construye el tema de radio buttons
  static RadioThemeData _buildRadioTheme(ColorScheme colorScheme) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primary;
        }
        return colorScheme.outline;
      }),
    );
  }

  /// Construye el tema de tabs
  static TabBarTheme _buildTabBarTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return TabBarTheme(
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurface.withOpacity(0.7),
      labelStyle: AppTextStyles.labelLarge,
      unselectedLabelStyle: AppTextStyles.labelLarge,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
    );
  }

  /// Construye el tema de tooltips
  static TooltipThemeData _buildTooltipTheme(
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return TooltipThemeData(
      decoration: BoxDecoration(
        color: colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(4),
      ),
      textStyle: textTheme.bodySmall?.copyWith(
        color: colorScheme.onInverseSurface,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }
}
