import 'package:equatable/equatable.dart';

class LoanModel extends Equatable {
  String? accountNumber;
  double? balance;
  double? interestRate;
  String? expiredDate;

  LoanModel(
      {this.accountNumber, this.balance, this.interestRate, this.expiredDate});

  factory LoanModel.fromJson(Map<String, dynamic> json) {
    return LoanModel(
        accountNumber: json['account_number'],
        balance: (json['balance'] as num).toDouble(),
        interestRate: json['interest_rate'],
        expiredDate: json['expired_date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_number'] = accountNumber;
    data['balance'] = balance;
    data['interest_rate'] = interestRate;
    data['expired_date'] = expiredDate;
    return data;
  }

  @override
  List<Object?> get props =>
      [accountNumber, balance, interestRate, expiredDate];
}
