import 'package:currency_converter/src/shared/system_design/colors/app_colors.dart';
import 'package:currency_converter/src/shared/system_design/spacing/app_spacing.dart';
import 'package:currency_converter/src/shared/system_design/typography/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Extensions for BuildContext that facilitate theme access
extension ThemeExtensions on BuildContext {
  /// Access to current theme
  ThemeData get theme => Theme.of(this);

  /// Access to color scheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Access to text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Checks if current theme is dark
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Checks if current theme is light
  bool get isLightMode => Theme.of(this).brightness == Brightness.light;

  /// Access to design system colors
  AppColorsThemeExtension get appColors => AppColorsThemeExtension(this);

  /// Access to design system text styles
  AppTextStylesThemeExtension get appTextStyles =>
      AppTextStylesThemeExtension(this);

  /// Access to design system spacing
  AppSpacingThemeExtension get appSpacing => AppSpacingThemeExtension(this);
}

/// Extension that provides access to design system colors
/// considering current theme (light/dark)
class AppColorsThemeExtension {
  const AppColorsThemeExtension(this.context);
  final BuildContext context;

  /// Colors that adapt to current theme
  ColorScheme get scheme => context.colorScheme;

  // ===== MAIN COLORS =====

  Color get primary => scheme.primary;
  Color get secondary => scheme.secondary;
  Color get tertiary => scheme.tertiary;
  Color get surface => scheme.surface;
  Color get background => scheme.surface;
  Color get error => scheme.error;

  // ===== ADAPTIVE TEXT COLORS =====

  Color get textPrimary => scheme.onSurface;
  Color get textSecondary => scheme.onSurface.withOpacity(0.7);
  Color get textOnPrimary => scheme.onPrimary;
  Color get textOnSecondary => scheme.onSecondary;
  Color get textOnSurface => scheme.onSurface;
  Color get textOnBackground => scheme.onSurface;
  Color get textOnError => scheme.onError;

  // ===== APP-SPECIFIC COLORS =====

  /// Colors that don't change with theme
  Color get success => AppColors.successGreen;
  Color get warning => AppColors.warningYellow;
  Color get info => AppColors.infoBlue;

  /// Price color (always secondary)
  Color get price => AppColors.secondary;

  /// Link color
  Color get link => context.isDarkMode
      ? AppColors.primary.withOpacity(0.8)
      : AppColors.primary;

  // ===== INPUT COLORS =====

  Color get inputBorder =>
      context.isDarkMode ? AppColors.mediumGray : AppColors.inputBorder;

  Color get inputBorderFocus => AppColors.inputBorderFocus;
  Color get inputBorderError => AppColors.inputBorderError;

  Color get inputBackground =>
      context.isDarkMode ? scheme.surface : AppColors.inputBackground;

  Color get inputPlaceholder => context.isDarkMode
      ? scheme.onSurface.withOpacity(0.5)
      : AppColors.inputPlaceholder;

  Color get inputText => scheme.onSurface;

  Color get inputDisabled => context.isDarkMode
      ? scheme.onSurface.withOpacity(0.12)
      : AppColors.inputDisabled;

  // ===== BUTTON COLORS =====

  Color get buttonPrimary => scheme.primary;
  Color get buttonSecondary => scheme.secondary;
  Color get buttonDisabled => context.isDarkMode
      ? scheme.onSurface.withOpacity(0.12)
      : AppColors.buttonDisabled;

  // ===== MOTO LENIADOR SPECIFIC COLORS =====

  /// Colors for maps
  Color get mapMarker => AppColors.mapMarker;
  Color get currentLocation => AppColors.currentLocation;
  Color get routePath => AppColors.routePath;
  Color get destinationMarker => AppColors.destinationMarker;

  /// Colors for order states
  Color get orderPending => AppColors.orderPending;
  Color get orderInProgress => AppColors.orderInProgress;
  Color get orderDelivered => AppColors.orderDelivered;
  Color get orderCancelled => AppColors.orderCancelled;

  // ===== ADAPTIVE NEUTRAL COLORS =====

  Color get divider => scheme.outline.withOpacity(0.12);
  Color get shadow => context.isDarkMode ? Colors.black54 : Colors.black26;
  Color get overlay => context.isDarkMode ? Colors.white10 : Colors.black26;

  // ===== ADAPTIVE GRADIENTS =====

  LinearGradient get primaryGradient => context.isDarkMode
      ? LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.8),
            AppColors.secondary.withOpacity(0.8),
          ],
        )
      : AppColors.primaryGradient;

  LinearGradient get successGradient => AppColors.successGradient;

  LinearGradient get warningGradient => AppColors.warningGradient;
}

/// Extension that provides access to design system text styles
/// with colors adaptive to current theme
class AppTextStylesThemeExtension {
  const AppTextStylesThemeExtension(this.context);
  final BuildContext context;

  TextTheme get _textTheme => context.textTheme;
  AppColorsThemeExtension get _colors => context.appColors;

  // ===== DISPLAY STYLES =====

  TextStyle get displayLarge =>
      _textTheme.displayLarge ?? AppTextStyles.displayLarge;
  TextStyle get displayMedium =>
      _textTheme.displayMedium ?? AppTextStyles.displayMedium;
  TextStyle get displaySmall =>
      _textTheme.displaySmall ?? AppTextStyles.displaySmall;

  // ===== HEADLINE STYLES =====

  TextStyle get headlineLarge =>
      _textTheme.headlineLarge ?? AppTextStyles.headlineLarge;
  TextStyle get headlineMedium =>
      _textTheme.headlineMedium ?? AppTextStyles.headlineMedium;
  TextStyle get headlineSmall =>
      _textTheme.headlineSmall ?? AppTextStyles.headlineSmall;

  // ===== TITLE STYLES =====

  TextStyle get titleLarge => _textTheme.titleLarge ?? AppTextStyles.titleLarge;
  TextStyle get titleMedium =>
      _textTheme.titleMedium ?? AppTextStyles.titleMedium;
  TextStyle get titleSmall => _textTheme.titleSmall ?? AppTextStyles.titleSmall;

  // ===== BODY STYLES =====

  TextStyle get bodyLarge => _textTheme.bodyLarge ?? AppTextStyles.bodyLarge;
  TextStyle get bodyMedium => _textTheme.bodyMedium ?? AppTextStyles.bodyMedium;
  TextStyle get bodySmall => _textTheme.bodySmall ?? AppTextStyles.bodySmall;

  // ===== LABEL STYLES =====

  TextStyle get labelLarge => _textTheme.labelLarge ?? AppTextStyles.labelLarge;
  TextStyle get labelMedium =>
      _textTheme.labelMedium ?? AppTextStyles.labelMedium;
  TextStyle get labelSmall => _textTheme.labelSmall ?? AppTextStyles.labelSmall;

  // ===== SPECIFIC STYLES WITH ADAPTIVE COLORS =====

  /// Style for prices with adaptive color
  TextStyle get price => AppTextStyles.priceText.copyWith(
        color: _colors.price,
      );

  /// Style for delivery time
  TextStyle get deliveryTime => AppTextStyles.deliveryTime.copyWith(
        color: _colors.textSecondary,
      );

  /// Estilo para estados de pedido
  TextStyle get orderStatus => AppTextStyles.orderStatus;

  /// Estilo para direcciones
  TextStyle get address => AppTextStyles.addressText.copyWith(
        color: _colors.textSecondary,
      );

  /// Estilo para nombres de conductores
  TextStyle get driverName => AppTextStyles.driverName.copyWith(
        color: _colors.textPrimary,
      );

  /// Estilo para calificaciones
  TextStyle get rating => AppTextStyles.ratingText.copyWith(
        color: _colors.textPrimary,
      );

  /// Estilo para distancias
  TextStyle get distance => AppTextStyles.distanceText.copyWith(
        color: _colors.textSecondary,
      );

  /// Estilo para códigos de seguimiento
  TextStyle get trackingCode => AppTextStyles.trackingCode.copyWith(
        color: _colors.textPrimary,
      );

  /// Estilo para enlaces
  TextStyle get link => bodyMedium.copyWith(
        color: _colors.link,
        decoration: TextDecoration.underline,
      );

  /// Estilo para texto de error
  TextStyle get error => bodySmall.copyWith(
        color: _colors.error,
      );

  /// Estilo para texto de éxito
  TextStyle get success => bodySmall.copyWith(
        color: _colors.success,
      );

  /// Estilo para texto de advertencia
  TextStyle get warning => bodySmall.copyWith(
        color: _colors.warning,
      );

  /// Estilo para texto de información
  TextStyle get info => bodySmall.copyWith(
        color: _colors.info,
      );
}

/// Extensión que proporciona acceso al espaciado del sistema de diseño
/// con valores responsive
class AppSpacingThemeExtension {
  const AppSpacingThemeExtension(this.context);
  final BuildContext context;

  // ===== ESPACIADO ESTÁNDAR =====

  /// 2px
  double get s1 => AppSpacing.s1;

  /// 4px
  double get s2 => AppSpacing.s2;

  /// 8px
  double get s3 => AppSpacing.s3;

  /// 12px
  double get s4 => AppSpacing.s4;

  /// 16px
  double get s5 => AppSpacing.s5;

  /// 20px
  double get s6 => AppSpacing.s6;

  /// 24px
  double get s7 => AppSpacing.s7;

  /// 32px
  double get s8 => AppSpacing.s8;

  /// 40px
  double get s9 => AppSpacing.s9;

  /// 48px
  double get s10 => AppSpacing.s10;

  /// 56px
  double get s11 => AppSpacing.s11;

  /// 64px
  double get s12 => AppSpacing.s12;

  // ===== ESPACIADO RESPONSIVE =====

  /// Espaciado responsive para contenido principal
  double get contentResponsive => AppSpacing.responsive(context);

  /// Espaciado vertical responsive
  double get verticalResponsive => AppSpacing.verticalResponsive(context);

  /// Espaciado para pantallas según el dispositivo
  double get screenPadding {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) return AppSpacing.s5; // Mobile - 16px
    if (screenWidth < 1200) return AppSpacing.s7; // Tablet - 24px
    return AppSpacing.s8; // Desktop - 32px
  }

  // ===== PADDING RESPONSIVE =====

  EdgeInsets get screenPaddingInsets => EdgeInsets.all(screenPadding);

  EdgeInsets get contentPadding => EdgeInsets.symmetric(
        horizontal: screenPadding,
        vertical: verticalResponsive,
      );

  EdgeInsets get cardPadding => EdgeInsets.all(s5); // 16px
  EdgeInsets get buttonPadding => EdgeInsets.symmetric(
        horizontal: s7,
        vertical: s3,
      ); // 24px horizontal, 8px vertical
  EdgeInsets get inputPadding => EdgeInsets.symmetric(
        horizontal: s5,
        vertical: s3,
      ); // 16px horizontal, 8px vertical
  EdgeInsets get dialogPadding => EdgeInsets.all(s7); // 24px

  // ===== GAPS RESPONSIVE =====

  SizedBox get verticalGapResponsive => SizedBox(height: verticalResponsive);
  SizedBox get horizontalGapResponsive => SizedBox(width: contentResponsive);

  // ===== ACCESO A SPACING VERTICAL Y HORIZONTAL =====

  /// Acceso a espaciado vertical
  SizedBox verticalSpacing(double value) => SizedBox(height: value);

  /// Acceso a espaciado horizontal
  SizedBox horizontalSpacing(double value) => SizedBox(width: value);
}

/// Extensiones para widgets que facilitan la aplicación del tema
extension WidgetThemeExtensions on Widget {
  /// Aplica el color de texto primario del tema
  Widget withPrimaryTextColor(BuildContext context) {
    if (this is Text) {
      final text = this as Text;
      return Text(
        text.data ?? '',
        style: (text.style ?? const TextStyle()).copyWith(
          color: context.appColors.textPrimary,
        ),
      );
    }
    return this;
  }

  /// Aplica el color de texto secundario del tema
  Widget withSecondaryTextColor(BuildContext context) {
    if (this is Text) {
      final text = this as Text;
      return Text(
        text.data ?? '',
        style: (text.style ?? const TextStyle()).copyWith(
          color: context.appColors.textSecondary,
        ),
      );
    }
    return this;
  }

  /// Aplica padding responsive
  Widget withResponsivePadding(BuildContext context) {
    return Padding(
      padding: context.appSpacing.contentPadding,
      child: this,
    );
  }

  /// Aplica el color de superficie del tema como fondo
  Widget withSurfaceBackground(BuildContext context) {
    return ColoredBox(
      color: context.appColors.surface,
      child: this,
    );
  }
}

/// Extensiones para ThemeData que facilitan la personalización
extension ThemeDataExtensions on ThemeData {
  /// Crea una copia del tema con colores personalizados
  ThemeData withCustomColors({
    Color? primary,
    Color? secondary,
    Color? surface,
    Color? background,
    Color? error,
  }) {
    final newColorScheme = colorScheme.copyWith(
      primary: primary ?? colorScheme.primary,
      secondary: secondary ?? colorScheme.secondary,
      surface: surface ?? colorScheme.surface,
      error: error ?? colorScheme.error,
    );

    return copyWith(colorScheme: newColorScheme);
  }

  /// Crea una copia del tema con una fuente personalizada
  ThemeData withCustomFont(String fontFamily) {
    return copyWith(
      textTheme: textTheme.apply(fontFamily: fontFamily),
    );
  }

  /// Verifica si el tema es compatible con Material 3
  bool get isMaterial3Compatible => useMaterial3 == true;
}
