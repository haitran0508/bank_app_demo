import 'package:flutter/material.dart';

class AppThemeData {
  final primaryColor = const Color(0xFFF5FFA8);
  final secondaryColor = const Color(0xFF1E1F1F);

  final blueBankColor = const Color(0xFFB2D0CE);
  final amberBankColor = const Color(0xFFF2FE8D);
  final purpleBankColor = const Color(0xFFAA9EB7);

  final smallCardBackgroundColor = const Color(0xFF252626);
  final loanCardbackgroundColor = const Color(0xFF212121);
  final blurPurpleColor = const Color(0xFF433D48);
  final iconColorOnDark = const Color(0xFF79767D);

  final cardBlueGradient = const <Color>[Color(0xFFB2D0CE), Color(0xFFEAEAEA)];
  final cardAmberGradient = const <Color>[Color(0xFFF1FE87), Color(0xFFFCFFDF)];
  final cardPurpleGradient = const <Color>[
    Color(0xFFB8A9C6),
    Color(0xFFF2EFF4)
  ];

  final bottomBarColor = const Color(0xFF1E1E1E).withOpacity(0.8);

  final textColorOnDark = const Color(0xFFFFFFFF);
  final textColorOnRegular = const Color(0xFF272A32);

  final textH1 = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    height: 32 / 25,
  );

  final textB1 = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    height: 24 / 17,
  );
  final textB5 = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 18 / 15,
  );

  final textC2 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
  );
  final textC3 = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 12 / 11,
  );
  final textC4 = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 14 / 10,
  );
}
