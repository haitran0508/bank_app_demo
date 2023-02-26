import 'package:equatable/equatable.dart';

import 'card.dart';
import 'loan.dart';

class AccountModel extends Equatable {
  double? balance;
  List<CardModel>? cards;
  List<LoanModel>? loans;

  AccountModel({
    this.balance,
    this.cards,
    this.loans,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    final cards = <CardModel>[];
    final loans = <LoanModel>[];
    if (json['cards'] != null) {
      json['cards'].forEach((item) {
        cards.add(CardModel.fromJson(item));
      });
    }
    if (json['loans'] != null) {
      json['loans'].forEach((item) {
        loans.add(LoanModel.fromJson(item));
      });
    }
    return AccountModel(
      balance: (json['balance'] as num).toDouble(),
      cards: cards,
      loans: loans,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balance'] = balance;
    if (cards != null) {
      data['cards'] = cards!.map((item) => item.toJson()).toList();
    }
    if (loans != null) {
      data['loans'] = loans!.map((item) => item.toJson()).toList();
    }

    return data;
  }

  @override
  List<Object?> get props => [balance, cards, loans];
}
