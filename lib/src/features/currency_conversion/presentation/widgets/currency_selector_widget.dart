import 'package:currency_converter/src/domain/entities/currency.dart';
import 'package:currency_converter/src/shared/system_design/system_design.dart';
import 'package:flutter/material.dart';

class CurrencySelector extends StatelessWidget {
  const CurrencySelector({
    required this.label,
    required this.currency,
    required this.onTap,
    super.key,
  });

  final String label;
  final Currency currency;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s1,
          vertical: AppSpacing.s4,
        ).copyWith(top: AppSpacing.s1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            AppSpacing.vertical.s3,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  currency.path,
                  width: AppSpacing.s5,
                  height: AppSpacing.s5,
                ),
                const SizedBox(width: 6),
                Text(
                  currency.symbol,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
                AppSpacing.horizontal.s3,
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.textSecondary,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
