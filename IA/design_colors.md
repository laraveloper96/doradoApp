# Color Palette - Currency Converter App

## Design Analysis

This color palette has been extracted from the analysis of the Currency Converter application design screens, including the images `screen_1.jpg`, `sheet_1.jpg`, and `sheet_2.jpg`.

## Primary Colors

### Background Colors
- **Primary Background**: `#FFFFFF` (White)
- **Secondary Background**: `#F8F9FA` (Very Light Gray)
- **Card Background**: `#FFFFFF` (White)

### Accent Colors
- **Primary Blue**: `#007AFF` (iOS Blue)
- **Secondary Blue**: `#5AC8FA` (Light Blue)
- **Success Green**: `#34C759` (Green)
- **Warning Orange**: `#FF9500` (Orange)

### Text Colors
- **Primary Text**: `#000000` (Black)
- **Secondary Text**: `#8E8E93` (Medium Gray)
- **Tertiary Text**: `#C7C7CC` (Light Gray)
- **Text on Dark Background**: `#FFFFFF` (White)

### Border and Divider Colors
- **Primary Border**: `#E5E5EA` (Very Light Gray)
- **Secondary Border**: `#D1D1D6` (Light Gray)
- **Divider**: `#F2F2F7` (Very Light Gray)

## Extended Palette

### Blue Tones
```
Primary Blue: #007AFF
Light Blue: #5AC8FA
Dark Blue: #0051D5
Very Light Blue: #E3F2FD
```

### Gray Tones
```
Black: #000000
Dark Gray: #1C1C1E
Medium Gray: #8E8E93
Light Gray: #C7C7CC
Very Light Gray: #F2F2F7
White: #FFFFFF
```

### State Colors
```
Success: #34C759
Warning: #FF9500
Error: #FF3B30
Info: #007AFF
```

## Recommended Usage

### UI Components

#### Buttons
- **Primary Button**: Background `#007AFF`, Text `#FFFFFF`
- **Secondary Button**: Background `#F2F2F7`, Text `#007AFF`
- **Disabled Button**: Background `#E5E5EA`, Text `#C7C7CC`

#### Input Fields
- **Normal Border**: `#E5E5EA`
- **Active Border**: `#007AFF`
- **Background**: `#FFFFFF`
- **Text**: `#000000`
- **Placeholder**: `#8E8E93`

#### Cards and Containers
- **Background**: `#FFFFFF`
- **Border**: `#E5E5EA`
- **Shadow**: `rgba(0, 0, 0, 0.1)`

### Text Hierarchy
- **Primary Title**: `#000000`, weight 700
- **Secondary Title**: `#000000`, weight 600
- **Body Text**: `#000000`, weight 400
- **Secondary Text**: `#8E8E93`, weight 400
- **Helper Text**: `#C7C7CC`, weight 400

## Flutter Implementation

### Color Constants Definition
Following the project's coding rules, all colors should be defined as constants with proper naming conventions:

```dart
/// App color constants following Clean Architecture principles
/// All colors are defined as const for optimal performance
class AppColors {
  // Private constructor to prevent instantiation
  const AppColors._();
  
  // Primary colors
  static const Color primary = Color(0xFF007AFF);
  static const Color secondary = Color(0xFF5AC8FA);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF8F9FA);
  
  // Text colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF8E8E93);
  static const Color textTertiary = Color(0xFFC7C7CC);
  static const Color textOnDark = Color(0xFFFFFFFF);
  
  // State colors
  static const Color success = Color(0xFF34C759);
  static const Color warning = Color(0xFFFF9500);
  static const Color error = Color(0xFFFF3B30);
  static const Color info = Color(0xFF007AFF);
  
  // Border and divider colors
  static const Color border = Color(0xFFE5E5EA);
  static const Color borderSecondary = Color(0xFFD1D1D6);
  static const Color divider = Color(0xFFF2F2F7);
  
  // Extended blue palette
  static const Color blueDark = Color(0xFF0051D5);
  static const Color blueLight = Color(0xFF5AC8FA);
  static const Color blueVeryLight = Color(0xFFE3F2FD);
  
  // Extended gray palette
  static const Color grayDark = Color(0xFF1C1C1E);
  static const Color grayMedium = Color(0xFF8E8E93);
  static const Color grayLight = Color(0xFFC7C7CC);
  static const Color grayVeryLight = Color(0xFFF2F2F7);
}
```

### Theme Configuration
Following Clean Architecture and project conventions:

```dart
/// Application theme configuration
/// Implements Material Design 3 with custom color scheme
class AppTheme {
  const AppTheme._();
  
  /// Light theme configuration
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      background: AppColors.background,
      error: AppColors.error,
      onPrimary: AppColors.textOnDark,
      onSecondary: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
      onBackground: AppColors.textPrimary,
      onError: AppColors.textOnDark,
    ),
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.surface,
    dividerColor: AppColors.divider,
    
    // Button themes following project conventions
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
    
    // Input decoration theme
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
      ),
      fillColor: AppColors.background,
      filled: true,
    ),
  );
  
  /// Dark theme configuration (future implementation)
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // TODO: Implement dark theme colors
  );
}
```

### Usage in Widgets
Following the project's widget naming conventions and const constructors:

```dart
/// Example of proper color usage in widgets
class CurrencyConversionCard extends StatelessWidget {
  const CurrencyConversionCard({
    required this.fromCurrency,
    required this.toCurrency,
    required this.amount,
    super.key,
  });
  
  final String fromCurrency;
  final String toCurrency;
  final double amount;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.border),
        ),
      ),
      child: Column(
        children: [
          // Currency input section
          const CurrencyInputSection(),
          
          // Divider
          const Divider(color: AppColors.divider),
          
          // Conversion result section
          const ConversionResultSection(),
        ],
      ),
    );
  }
}
```

## Accessibility Guidelines

### Color Contrast Requirements
- **Normal text on white background**: Minimum ratio 4.5:1
- **Large text on white background**: Minimum ratio 3:1
- **Interactive elements**: Minimum ratio 3:1
- **Focus indicators**: Minimum ratio 3:1

### Color-blind Friendly Design
- Use icons and patterns in addition to color to convey information
- Avoid problematic combinations like red-green for critical information
- Provide textual alternatives for color-based information
- Test with color-blind simulation tools

### Implementation Example
```dart
/// Accessible button widget following project conventions
class AccessibleButton extends StatelessWidget {
  const AccessibleButton({
    required this.onPressed,
    required this.child,
    this.type = ButtonType.primary,
    super.key,
  });
  
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonType type;
  
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onPressed != null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _getButtonStyle(type),
        child: child,
      ),
    );
  }
  
  ButtonStyle _getButtonStyle(ButtonType type) {
    switch (type) {
      case ButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnDark,
        );
      case ButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.primary,
        );
    }
  }
}

enum ButtonType { primary, secondary }
```

## Design System Integration

### Component Library Structure
Following Clean Architecture principles:

```
lib/src/shared/
├── theme/
│   ├── app_colors.dart
│   ├── app_theme.dart
│   └── theme.dart (barrel file)
├── widgets/
│   ├── buttons/
│   ├── cards/
│   ├── inputs/
│   └── widgets.dart (barrel file)
└── shared.dart (main barrel file)
```

### Best Practices

1. **Consistency**: Maintain color consistency across all application screens
2. **Performance**: Use const constructors and const colors for optimal performance
3. **Maintainability**: Centralize color definitions in a single source of truth
4. **Scalability**: Design the color system to support future themes (dark mode)
5. **Accessibility**: Always consider color contrast and color-blind users

### Design Notes

1. **Brand Identity**: Blue colors reflect trust and professionalism appropriate for a financial app
2. **Visual Hierarchy**: Use color variations and opacity to create hierarchy without introducing new colors
3. **Future Considerations**: The color system is designed to easily support dark mode implementation
4. **Material Design**: Colors follow Material Design 3 guidelines while maintaining brand identity

## Testing Colors

### Unit Tests Example
```dart
// test/shared/theme/app_colors_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:currency_converter/src/shared/shared.dart';

void main() {
  group('AppColors', () {
    test('should have correct primary color value', () {
      expect(AppColors.primary.value, equals(0xFF007AFF));
    });
    
    test('should have accessible contrast ratios', () {
      // Test color contrast ratios for accessibility
      // Implementation depends on contrast calculation utility
    });
  });
}
```

---

*Document generated on: 2024*  
*Version: 2.0*  
*Following Currency Converter App coding standards*