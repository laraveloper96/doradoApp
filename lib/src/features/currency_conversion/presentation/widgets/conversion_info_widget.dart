import 'package:currency_converter/src/domain/entities/currency.dart';
import 'package:currency_converter/src/features/currency_conversion/domain/extensions/exchange_swap_state_ext.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange_swap/exchange_swap_cubit.dart';
import 'package:currency_converter/src/shared/system_design/system_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversionInfo extends StatelessWidget {
  const ConversionInfo(this.currency, {super.key});

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    final swapCubit = context.watch<ExchangeSwapCubit>();
    final swapState = swapCubit.state;
    final convertedAmount = swapState.convertedAmount;
    final rate = swapCubit.rate;

    return Column(
      children: [
        AppSpacing.vertical.s3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tasa estimada',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              '≈ ${rate.toStringAsFixed(2)} ${currency.symbol}',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        AppSpacing.vertical.s3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recibirás',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              '≈ ${convertedAmount.toStringAsFixed(2)} ${currency.symbol}',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        AppSpacing.vertical.s3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tiempo estimado',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              '≈ 10 Min',
              style: AppTextStyles.labelMedium.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
