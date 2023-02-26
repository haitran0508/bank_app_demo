import 'package:equatable/equatable.dart';

class Loan extends Equatable {
  const Loan(
      {required this.number,
      required this.balance,
      required this.rate,
      required this.expiredDate});

  final String number;
  final double balance;
  final double rate;
  final String expiredDate;

  @override
  List<Object?> get props => [number, balance, rate, expiredDate];
}
