import 'dart:async';

import 'package:currency_converter/src/domain/entities/currency.dart';
import 'package:currency_converter/src/features/currency_conversion/presentation/cubit/exchange_swap/exchange_swap_cubit.dart';
import 'package:currency_converter/src/shared/system_design/system_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountInputWidget extends StatefulWidget {
  const AmountInputWidget({required this.currency, super.key});
  final Currency currency;

  @override
  State<AmountInputWidget> createState() => _AmountInputWidgetState();
}

class _AmountInputWidgetState extends State<AmountInputWidget> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller.text = '${context.read<ExchangeSwapCubit>().amount}';
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onAmountChanged(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 800), () {
      context
          .read<ExchangeSwapCubit>()
          .updateAmount(double.tryParse(value) ?? 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s5,
        vertical: AppSpacing.s1,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            widget.currency.symbol,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          AppSpacing.horizontal.s4,
          Expanded(
            child: TextFormField(
              controller: _controller,
              onChanged: _onAmountChanged,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                hintText: '5.00',
                hintStyle: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.inputPlaceholder,
                  fontWeight: FontWeight.w600,
                ),
                border: InputBorder.none,
                fillColor: AppColors.pureWhite,
                contentPadding: EdgeInsets.zero,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ),
        ],
      ),
    );
  }
}
