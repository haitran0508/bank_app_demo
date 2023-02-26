import 'package:equatable/equatable.dart';

class Card extends Equatable {
  const Card(
      {required this.type,
      required this.accountTitle,
      required this.balance,
      required this.number});

  final String type;
  final String accountTitle;
  final double balance;
  final String number;

  @override
  List<Object?> get props => [type, accountTitle, balance, number];
}
