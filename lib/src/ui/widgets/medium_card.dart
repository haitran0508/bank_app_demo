import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../../cores/theme/theme.dart';

class MediumCard extends StatelessWidget {
  const MediumCard({
    super.key,
    required this.cardTitle,
    required this.accountTitle,
    required this.balance,
    required this.number,
    required this.gradients,
  });

  final String cardTitle;
  final String accountTitle;
  final String balance;
  final String number;
  final List<Color> gradients;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 148,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: gradients,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 29.95),
          Text(
            cardTitle,
          ),
          const SizedBox(height: 30),
          Text(accountTitle,
              style: AppTheme.of(context)!.theme.textC3.copyWith(
                    color: AppTheme.of(context)!.theme.textColorOnRegular,
                  )),
          const SizedBox(height: 2),
          Text('\$$balance',
              style: AppTheme.of(context)!.theme.textB1.copyWith(
                    color: AppTheme.of(context)!.theme.textColorOnRegular,
                  )),
          const SizedBox(height: 26),
          Text(number,
              style: AppTheme.of(context)!.theme.textC3.copyWith(
                    color: AppTheme.of(context)!.theme.textColorOnRegular,
                  ))
        ],
      ),
    );
  }
}
