import 'package:equatable/equatable.dart';

import 'card.dart';
import 'loan.dart';

class AccountSummary extends Equatable {
  const AccountSummary(
      {required this.cards, required this.loans, required this.balance});
  final double balance;
  final List<Card> cards;
  final List<Loan> loans;

  @override
  List<Object?> get props => [cards, loans];
}
