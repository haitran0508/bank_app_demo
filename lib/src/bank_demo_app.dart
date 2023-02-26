import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cores/theme/theme.dart';
import 'ui/screens/tab_view_screen.dart';

class BankDemoApp extends StatefulWidget {
  const BankDemoApp({super.key});

  @override
  State<BankDemoApp> createState() => _BankDemoAppState();
}

class _BankDemoAppState extends State<BankDemoApp> {
  @override
  Widget build(BuildContext context) {
    return AppTheme.dark(
      child: const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: TabViewScreen(),
      ),
    );
  }
}
