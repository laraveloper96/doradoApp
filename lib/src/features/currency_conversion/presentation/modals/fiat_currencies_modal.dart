import 'package:currency_converter/l10n/l10n.dart';
import 'package:currency_converter/src/features/currency_conversion/domain/extensions/exchange_state_ext.dart';
import 'package:currency_converter/src/features/currency_conversion/domain/extensions/exchange_swap_state_ext.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange/exchange_cubit.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange_swap/exchange_swap_cubit.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/widgets/currency_item_widget.dart';
import 'package:currency_converter/src/shared/system_design/colors/app_colors.dart';
import 'package:currency_converter/src/shared/system_design/spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiatCurrenciesModal extends StatefulWidget {
  const FiatCurrenciesModal({
    super.key,
  });

  @override
  State<FiatCurrenciesModal> createState() => _FiatCurrenciesModalState();
}

class _FiatCurrenciesModalState extends State<FiatCurrenciesModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.s6),
          topRight: Radius.circular(AppSpacing.s6),
        ),
      ),
      child: const Column(
        children: [
          ModalHeader(),
          Flexible(
            child: CurrencyList(),
          ),
        ],
      ),
    );
  }
}

/// Header component for the modal
class ModalHeader extends StatelessWidget {
  const ModalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.s6),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.s6),
          topRight: Radius.circular(AppSpacing.s6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Indicador de arrastre
          Center(
            child: Container(
              width: AppSpacing.s9,
              height: AppSpacing.s2,
              decoration: BoxDecoration(
                color: AppColors.inputBorder,
                borderRadius: BorderRadius.circular(AppSpacing.s1),
              ),
            ),
          ),
          AppSpacing.vertical.s5,
          Text(
            context.l10n.fiat,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

/// Currency list component
class CurrencyList extends StatelessWidget {
  const CurrencyList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.s5),
      child: BlocBuilder<ExchangeCubit, ExchangeState>(
        builder: (context, state) {
          final currencies = state.currenciesByState ?? [];
          if (currencies.isEmpty) return const SizedBox.shrink();

          final fiatCurrencies = state.fiatCurrencies ?? [];

          final swapCubit = context.watch<ExchangeSwapCubit>();

          return ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s5,
              vertical: AppSpacing.s3,
            ),
            itemCount: fiatCurrencies.length,
            separatorBuilder: (context, index) => const Divider(
              color: AppColors.inputBorder,
              height: 1,
              thickness: 1,
              indent: 44,
            ),
            itemBuilder: (context, index) {
              final currency = fiatCurrencies[index];
              return CurrencyItem(
                currency: currency,
                isSelected: currency == swapCubit.state.selectedFiatByState,
                onTap: () {
                  context
                      .read<ExchangeSwapCubit>()
                      .selectFiatCurrency(currency);
                },
              );
            },
          );
        },
      ),
    );
  }
}
