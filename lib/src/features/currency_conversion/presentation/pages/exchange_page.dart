import 'package:currency_converter/l10n/l10n.dart';
import 'package:currency_converter/src/core/di/app_modules.dart';
import 'package:currency_converter/src/core/utils/extensions.dart';
import 'package:currency_converter/src/features/currency_conversion/domain/extensions/exchange_state_ext.dart';
import 'package:currency_converter/src/features/currency_conversion/domain/extensions/exchange_swap_state_ext.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange/exchange_cubit.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange_swap/exchange_swap_cubit.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/modals/cripto_currencies_modal.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/modals/fiat_currencies_modal.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/widgets/widgets.dart';
import 'package:currency_converter/src/shared/system_design/system_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Main exchange page
class ExchangePage extends StatelessWidget {
  /// Creates an ExchangePage
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ExchangeCubit>()..loadCurrencies(),
        ),
        BlocProvider(create: (context) => getIt<ExchangeSwapCubit>()),
      ],
      child: const ExchangeView(),
    );
  }
}

/// The main view for exchange
class ExchangeView extends StatelessWidget {
  /// Creates an ExchangeView
  const ExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: CurvedBackgroundPainter(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.s5),
              child: BlocConsumer<ExchangeCubit, ExchangeState>(
                listener: (context, state) {
                  state.whenOrNull(
                    failure: (message) {
                      context.showSnackBar(message);
                    },
                    success: (currencies) {
                      final swapCubit = context.read<ExchangeSwapCubit>();
                      final fiatCurrency = state.fiatCurrencies?.firstOrNull;
                      final cryptoCurrency =
                          state.cryptoCurrencies?.firstOrNull;
                      swapCubit.loadCurrencies(
                        fiatCurrency: fiatCurrency,
                        cryptoCurrency: cryptoCurrency,
                      );
                    },
                  );
                },
                builder: (BuildContext context, ExchangeState state) {
                  return BlocConsumer<ExchangeSwapCubit, ExchangeSwapState>(
                    listener: (context, state) {
                      state.mapOrNull(
                        swap: (validation) {
                          validation.validationState.mapOrNull(
                            error: (error) {
                              context.showSnackBar(error.error.message);
                            },
                          );
                        },
                      );
                    },
                    builder: (context, state) {
                      final selectedFiat = state.selectedFiatByState;
                      if (selectedFiat == null) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return const Column(
                        children: [
                          Expanded(
                            child: Center(
                              child: _ConversionCard(),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Card containing the conversion inputs
class _ConversionCard extends StatefulWidget {
  const _ConversionCard();

  @override
  State<_ConversionCard> createState() => _ConversionCardState();
}

class _ConversionCardState extends State<_ConversionCard> {
  final TextEditingController _amountController = TextEditingController();

  double get amount => double.tryParse(_amountController.text) ?? 0.0;

  void _showModal({
    required BuildContext context,
    required bool hasCrypto,
  }) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: context.read<ExchangeCubit>(),
            ),
            BlocProvider.value(
              value: context.read<ExchangeSwapCubit>(),
            ),
          ],
          child: hasCrypto
              ? const CryptoCurrenciesModal()
              : const FiatCurrenciesModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final swapCubit = context.watch<ExchangeSwapCubit>();
    final hasCrypto = swapCubit.state.hasCrypto;
    final selectedFiat = swapCubit.state.selectedFiatByState;
    final selectedCrypto = swapCubit.state.selectedCryptoByState;
    final selectedFrom = hasCrypto ? selectedCrypto : selectedFiat;
    final selectedTo = hasCrypto ? selectedFiat : selectedCrypto;

    if (selectedFrom == null || selectedTo == null) {
      return const SizedBox.shrink();
    }
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppColors.primary, width: 1.5),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: CurrencySelector(
                          label: context.l10n.iHave,
                          currency: selectedFrom,
                          onTap: () => _showModal(
                            context: context,
                            hasCrypto: hasCrypto,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: swapCubit.swap,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.swap_horiz_outlined,
                            color: AppColors.textOnDark,
                            size: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: CurrencySelector(
                          label: context.l10n.iWant,
                          currency: selectedTo,
                          onTap: () => _showModal(
                            context: context,
                            hasCrypto: !hasCrypto,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          AppSpacing.vertical.s6,
          AmountInputWidget(currency: selectedFrom),
          AppSpacing.vertical.s7,
          ConversionInfo(selectedTo),
          AppSpacing.vertical.s7,
          const SwapButtonWidget(),
        ],
      ),
    );
  }
}
