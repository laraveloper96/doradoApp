import 'package:currency_converter/src/shared/system_design/typography/app_text_styles.dart';
import 'package:flutter/material.dart';

/// Extensions for BuildContext that facilitate access to text styles
/// from the design system from any widget.
extension TextStyleExtensions on BuildContext {
  /// Quick access to text styles
  AppTextStylesExtension get textStyles => AppTextStylesExtension(this);

  /// Access to current text theme
  TextTheme get textTheme => Theme.of(this).textTheme;
}

/// Class that provides organized access to all text styles
class AppTextStylesExtension {
  const AppTextStylesExtension(this.context);

  final BuildContext context;

  // ===== DISPLAY STYLES =====

  /// Main screen titles, splash screens
  TextStyle get displayLarge => _getResponsiveStyle(AppTextStyles.displayLarge);

  /// Important section titles
  TextStyle get displayMedium =>
      _getResponsiveStyle(AppTextStyles.displayMedium);

  /// Main card titles
  TextStyle get displaySmall => _getResponsiveStyle(AppTextStyles.displaySmall);

  // ===== HEADLINE STYLES =====

  /// Page titles, main headers
  TextStyle get headlineLarge =>
      _getResponsiveStyle(AppTextStyles.headlineLarge);

  /// Important subtitles, service names
  TextStyle get headlineMedium =>
      _getResponsiveStyle(AppTextStyles.headlineMedium);

  /// Section titles, categories
  TextStyle get headlineSmall =>
      _getResponsiveStyle(AppTextStyles.headlineSmall);

  // ===== TITLE STYLES =====

  /// Dialog titles, product/service names
  TextStyle get titleLarge => _getResponsiveStyle(AppTextStyles.titleLarge);

  /// Subtitles, element names
  TextStyle get titleMedium => _getResponsiveStyle(AppTextStyles.titleMedium);

  /// Small component titles
  TextStyle get titleSmall => _getResponsiveStyle(AppTextStyles.titleSmall);

  // ===== BODY STYLES =====

  /// Main text, important descriptions
  TextStyle get bodyLarge => _getResponsiveStyle(AppTextStyles.bodyLarge);

  /// Standard text, general content
  TextStyle get bodyMedium => _getResponsiveStyle(AppTextStyles.bodyMedium);

  /// Secondary text, notes
  TextStyle get bodySmall => _getResponsiveStyle(AppTextStyles.bodySmall);

  // ===== LABEL STYLES =====

  /// Main buttons, important labels
  TextStyle get labelLarge => _getResponsiveStyle(AppTextStyles.labelLarge);

  /// Secondary buttons, tabs
  TextStyle get labelMedium => _getResponsiveStyle(AppTextStyles.labelMedium);

  /// Small labels, badges, chips
  TextStyle get labelSmall => _getResponsiveStyle(AppTextStyles.labelSmall);

  // ===== MOTO LENIADOR SPECIFIC STYLES =====

  /// Style for displaying service prices
  TextStyle get price => _getResponsiveStyle(AppTextStyles.priceText);

  /// Style for estimated delivery time
  TextStyle get deliveryTime => _getResponsiveStyle(AppTextStyles.deliveryTime);

  /// Style for order status
  TextStyle get orderStatus => _getResponsiveStyle(AppTextStyles.orderStatus);

  /// Style for addresses and locations
  TextStyle get address => _getResponsiveStyle(AppTextStyles.addressText);

  /// Style for driver/lumberjack names
  TextStyle get driverName => _getResponsiveStyle(AppTextStyles.driverName);

  /// Style for ratings and reviews
  TextStyle get rating => _getResponsiveStyle(AppTextStyles.ratingText);

  /// Style for distances
  TextStyle get distance => _getResponsiveStyle(AppTextStyles.distanceText);

  /// Style for tracking codes
  TextStyle get trackingCode => _getResponsiveStyle(AppTextStyles.trackingCode);

  // ===== PRIVATE METHODS =====

  /// Applies responsive scaling to a style
  TextStyle _getResponsiveStyle(TextStyle style) {
    return ResponsiveTextStyles.scaleTextStyle(style, context);
  }
}

/// Extensions for TextStyle that add convenience methods
extension TextStyleUtilities on TextStyle {
  /// Applies a specific color
  TextStyle colored(Color color) => copyWith(color: color);

  /// Applies bold weight
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  /// Applies semi-bold weight
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// Applies medium weight
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// Applies regular weight
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  /// Applies light weight
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  /// Applies italic style
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Applies underline decoration
  TextStyle get underlined => copyWith(decoration: TextDecoration.underline);

  /// Applies strikethrough decoration
  TextStyle get strikethrough =>
      copyWith(decoration: TextDecoration.lineThrough);

  /// Changes font size
  TextStyle sized(double size) => copyWith(fontSize: size);

  /// Changes line height
  TextStyle withHeight(double height) => copyWith(height: height);

  /// Changes letter spacing
  TextStyle withLetterSpacing(double spacing) =>
      copyWith(letterSpacing: spacing);

  /// Changes font family
  TextStyle withFont(String fontFamily) => copyWith(fontFamily: fontFamily);

  /// Applies opacity to color
  TextStyle withOpacity(double opacity) {
    final currentColor = color ?? Colors.black;
    return copyWith(color: currentColor.withOpacity(opacity));
  }

  /// Applies multiple modifications
  TextStyle modify({
    Color? color,
    FontWeight? weight,
    double? size,
    String? fontFamily,
    FontStyle? style,
    TextDecoration? decoration,
    double? letterSpacing,
    double? height,
    double? opacity,
  }) {
    var finalColor = color;
    if (opacity != null && finalColor != null) {
      finalColor = finalColor.withOpacity(opacity);
    } else if (opacity != null) {
      final currentColor = this.color ?? Colors.black;
      finalColor = currentColor.withOpacity(opacity);
    }

    return copyWith(
      color: finalColor,
      fontWeight: weight,
      fontSize: size,
      fontFamily: fontFamily,
      fontStyle: style,
      decoration: decoration,
      letterSpacing: letterSpacing,
      height: height,
    );
  }
}

/// Extensions for Text widget that facilitate style application
extension TextWidgetExtensions on Text {
  /// Applies a specific style while maintaining current text
  Text styled(TextStyle style) {
    return Text(
      data ?? '',
      style: style,
      key: key,
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  /// Applies a specific color
  Text colored(Color color) {
    final currentStyle = style ?? const TextStyle();
    return styled(currentStyle.copyWith(color: color));
  }

  /// Applies bold weight
  Text get bold {
    final currentStyle = style ?? const TextStyle();
    return styled(currentStyle.copyWith(fontWeight: FontWeight.bold));
  }

  /// Applies italic style
  Text get italic {
    final currentStyle = style ?? const TextStyle();
    return styled(currentStyle.copyWith(fontStyle: FontStyle.italic));
  }
}

/// Builder for creating text styles fluently
class TextStyleBuilder {
  TextStyleBuilder();

  /// Starts with a base style
  TextStyleBuilder.from(TextStyle baseStyle) : _style = baseStyle;

  var _style = const TextStyle();

  /// Applies color
  void color(Color color) {
    _style = _style.copyWith(color: color);
  }

  /// Applies size
  void size(double size) {
    _style = _style.copyWith(fontSize: size);
  }

  /// Applies weight
  void weight(FontWeight weight) {
    _style = _style.copyWith(fontWeight: weight);
  }

  /// Applies font family
  void font(String fontFamily) {
    _style = _style.copyWith(fontFamily: fontFamily);
  }

  /// Applies line height
  void height(double height) {
    _style = _style.copyWith(height: height);
  }

  /// Applies letter spacing
  void letterSpacing(double spacing) {
    _style = _style.copyWith(letterSpacing: spacing);
  }

  /// Applies decoration
  void decoration(TextDecoration decoration) {
    _style = _style.copyWith(decoration: decoration);
  }

  /// Applies italic style
  void italic() {
    _style = _style.copyWith(fontStyle: FontStyle.italic);
  }

  /// Applies bold weight
  void bold() {
    _style = _style.copyWith(fontWeight: FontWeight.bold);
  }

  /// Builds the final style
  TextStyle build() => _style;
}

/// Convenience methods for creating TextStyleBuilder
extension TextStyleBuilderExtensions on TextStyle {
  /// Creates a builder from this style
  TextStyleBuilder get builder => TextStyleBuilder.from(this);
}
