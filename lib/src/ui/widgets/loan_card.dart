import 'package:flutter/material.dart';

import '../../../cores/icons/bank_app_icons_icons.dart';
import '../../../cores/theme/theme.dart';

class LoanCard extends StatelessWidget {
  const LoanCard(
      {super.key,
      required this.number,
      required this.balance,
      required this.rate,
      required this.expiredDate});

  final String number;
  final String balance;
  final String rate;
  final String expiredDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 76,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.of(context)!
            .theme
            .loanCardbackgroundColor
            .withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(26)),
      ),
      child: Row(
        children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              color: AppTheme.of(context)!.theme.blueBankColor,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: const Icon(
              BankAppIcons.credit_card,
              size: 13,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account No $number',
                  style: AppTheme.of(context)!.theme.textB5.copyWith(
                        color: AppTheme.of(context)!.theme.textColorOnDark,
                      ),
                ),
                Text(
                  'Expires $expiredDate',
                  style: AppTheme.of(context)!.theme.textC2.copyWith(
                        color: AppTheme.of(context)!.theme.iconColorOnDark,
                      ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$$balance',
                style: AppTheme.of(context)!.theme.textB5.copyWith(
                      color: AppTheme.of(context)!.theme.textColorOnDark,
                    ),
              ),
              Text(
                '$rate%',
                style: AppTheme.of(context)!.theme.textC2.copyWith(
                      color: AppTheme.of(context)!.theme.iconColorOnDark,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
