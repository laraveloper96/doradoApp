import 'package:flutter/material.dart';

class AppSpacing {
  // ===== BASE SPACING =====

  /// 2px
  static const double s1 = 2;

  /// 4px
  static const double s2 = 4;

  /// 8px
  static const double s3 = 8;

  /// 12px
  static const double s4 = 12;

  /// 16px
  static const double s5 = 16;

  /// 20px
  static const double s6 = 20;

  /// 24px
  static const double s7 = 24;

  /// 32px
  static const double s8 = 32;

  /// 40px
  static const double s9 = 40;

  /// 48px
  static const double s10 = 48;

  /// 56px
  static const double s11 = 56;

  /// 64px
  static const double s12 = 64;

  /// Provides vertical spacing in pixels.
  static _VerticalSpacing get vertical => const _VerticalSpacing();

  /// Provides horizontal spacing in pixels.
  static _HorizontalSpacing get horizontal => const _HorizontalSpacing();

  // ===== CONTEXT-SPECIFIC SPACING =====

  /// Spacing for list elements
  static const double listItem = s5; // 16px

  /// Spacing between sections
  static const double section = s8; // 32px

  /// Spacing for cards
  static const double card = s5; // 16px

  /// Spacing for buttons
  static const double button = s3; // 8px

  /// Spacing for inputs/forms
  static const double input = s5; // 16px

  /// Spacing for navigation
  static const double navigation = s7; // 24px

  /// Spacing for main content
  static const double content = s5; // 16px

  /// Spacing for headers/titles
  static const double header = s7; // 24px

  // ===== SPACING FOR SPECIFIC COMPONENTS =====

  /// Internal spacing for buttons
  static const double buttonPadding = s5; // 16px

  /// Internal spacing for cards
  static const double cardPadding = s5; // 16px

  /// Internal spacing for dialogs
  static const double dialogPadding = s7; // 24px

  /// Internal spacing for bottom sheets
  static const double bottomSheetPadding = s7; // 24px

  /// Internal spacing for app bars
  static const double appBarPadding = s5; // 16px

  /// Internal spacing for tabs
  static const double tabPadding = s3; // 8px

  // ===== SPACING FOR SCREENS =====

  /// Horizontal padding for screens
  static const double screenHorizontal = s5; // 16px

  /// Vertical padding for screens
  static const double screenVertical = s7; // 24px

  /// Spacing between elements in screens
  static const double screenElements = s5; // 16px

  // ===== SPACING FOR MAPS AND LOCATION =====

  /// Spacing for map controls
  static const double mapControls = s5; // 16px

  /// Spacing for map markers
  static const double mapMarkers = s3; // 8px

  /// Spacing for location information
  static const double locationInfo = s5; // 16px

  // ===== SPACING FOR ORDERS =====

  /// Spacing between order elements
  static const double orderItems = s3; // 8px

  /// Spacing for order details
  static const double orderDetails = s5; // 16px

  /// Spacing for order status
  static const double orderStatus = s2; // 4px

  // ===== UTILITY METHODS =====

  /// Gets spacing based on multiples of 2px
  static double custom(double multiplier) => 2.0 * multiplier;

  /// Gets responsive spacing based on screen size
  static double responsive(
    BuildContext context, {
    double mobile = s5,
    double tablet = s7,
    double desktop = s8,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) return mobile;
    if (screenWidth < 1200) return tablet;
    return desktop;
  }

  /// Gets responsive vertical spacing
  static double verticalResponsive(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    if (screenHeight < 600) return s3;
    if (screenHeight < 800) return s5;
    return s7;
  }
}

/// Internal class for creating vertical spacing.
class _VerticalSpacing {
  const _VerticalSpacing();

  /// Vertical spacing of 2 pixels.
  SizedBox get s1 => const SizedBox(height: AppSpacing.s1);

  /// Vertical spacing of 4 pixels.
  SizedBox get s2 => const SizedBox(height: AppSpacing.s2);

  /// Vertical spacing of 8 pixels.
  SizedBox get s3 => const SizedBox(height: AppSpacing.s3);

  /// Vertical spacing of 12 pixels.
  SizedBox get s4 => const SizedBox(height: AppSpacing.s4);

  /// Vertical spacing of 16 pixels.
  SizedBox get s5 => const SizedBox(height: AppSpacing.s5);

  /// Vertical spacing of 20 pixels.
  SizedBox get s6 => const SizedBox(height: AppSpacing.s6);

  /// Vertical spacing of 24 pixels.
  SizedBox get s7 => const SizedBox(height: AppSpacing.s7);

  /// Vertical spacing of 32 pixels.
  SizedBox get s8 => const SizedBox(height: AppSpacing.s8);

  /// Vertical spacing of 40 pixels.
  SizedBox get s9 => const SizedBox(height: AppSpacing.s9);

  /// Vertical spacing of 48 pixels.
  SizedBox get s10 => const SizedBox(height: AppSpacing.s10);

  /// Vertical spacing of 56 pixels.
  SizedBox get s11 => const SizedBox(height: AppSpacing.s11);

  /// Vertical spacing of 64 pixels.
  SizedBox get s12 => const SizedBox(height: AppSpacing.s12);

  /// Expand in the vertical axis.
  SizedBox get expand => const SizedBox(height: double.infinity);
}

/// Internal class for creating horizontal spacing.
class _HorizontalSpacing {
  const _HorizontalSpacing();

  /// Horizontal spacing of 2 pixels.
  SizedBox get s1 => const SizedBox(width: AppSpacing.s1);

  /// Horizontal spacing of 4 pixels.
  SizedBox get s2 => const SizedBox(width: AppSpacing.s2);

  /// Horizontal spacing of 8 pixels.
  SizedBox get s3 => const SizedBox(width: AppSpacing.s3);

  /// Horizontal spacing of 12 pixels.
  SizedBox get s4 => const SizedBox(width: AppSpacing.s4);

  /// Horizontal spacing of 16 pixels.
  SizedBox get s5 => const SizedBox(width: AppSpacing.s5);

  /// Horizontal spacing of 20 pixels.
  SizedBox get s6 => const SizedBox(width: AppSpacing.s6);

  /// Horizontal spacing of 24 pixels.
  SizedBox get s7 => const SizedBox(width: AppSpacing.s7);

  /// Horizontal spacing of 32 pixels.
  SizedBox get s8 => const SizedBox(width: AppSpacing.s8);

  /// Horizontal spacing of 40 pixels.
  SizedBox get s9 => const SizedBox(width: AppSpacing.s9);

  /// Horizontal spacing of 48 pixels.
  SizedBox get s10 => const SizedBox(width: AppSpacing.s10);

  /// Horizontal spacing of 56 pixels.
  SizedBox get s11 => const SizedBox(width: AppSpacing.s11);

  /// Horizontal spacing of 64 pixels.
  SizedBox get s12 => const SizedBox(width: AppSpacing.s12);

  /// Expand in the horizontal axis.
  SizedBox get expand => const SizedBox(width: double.infinity);
}
