import 'package:currency_converter/l10n/l10n.dart';
import 'package:currency_converter/src/shared/system_design/system_design.dart';
import 'package:flutter/material.dart';

class SwapButtonWidget extends StatelessWidget {
  const SwapButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // TODO(any): Add conversion logic when button is pressed
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          context.l10n.exchange,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
