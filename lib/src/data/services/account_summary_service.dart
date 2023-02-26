import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/account.dart';

abstract class AccountSummayServiceInterface {
  // Override this method to get curated photos
  Future<AccountModel> getAccountSummary();
}

class AccountSummayService extends AccountSummayServiceInterface {
  AccountSummayService();

  @override
  Future<AccountModel> getAccountSummary() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      final data =
          await rootBundle.loadString('assets/data/account_summary.json');
      final result = json.decode(data);

      final account = AccountModel.fromJson(result);

      return account;
    } catch (e) {
      throw Exception(e);
    }
  }
}
