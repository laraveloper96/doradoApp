import 'package:currency_converter/src/domain/entities/currency.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange_swap/exchange_swap_cubit.dart';
import 'package:currency_converter/src/shared/system_design/system_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Individual currency item component
class CurrencyItem extends StatelessWidget {
  const CurrencyItem({
    required this.currency,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final Currency currency;

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExchangeSwapCubit, ExchangeSwapState>(
      builder: (context, state) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            onTap.call();
            Navigator.of(context).pop();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.s4,
              horizontal: AppSpacing.s2,
            ),
            child: Row(
              children: [
                // Icono de la moneda
                Image.asset(
                  currency.path,
                  width: AppSpacing.s7,
                  height: AppSpacing.s7,
                ),
                AppSpacing.horizontal.s5,
                // Información de la moneda
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currency.symbol,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                          height: 1.2,
                        ),
                      ),
                      AppSpacing.vertical.s1,
                      Text(
                        currency.name,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: AppSpacing.s6,
                  height: AppSpacing.s6,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.pureWhite,
                    borderRadius: BorderRadius.circular(AppSpacing.s3),
                    border: Border.all(
                      color:
                          isSelected ? AppColors.primary : AppColors.darkGray,
                    ),
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 14,
                    color: AppColors.textOnDark,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
