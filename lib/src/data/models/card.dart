import 'package:equatable/equatable.dart';

class CardModel extends Equatable {
  String? type;
  String? account;
  double? balance;
  String? cardNumber;

  CardModel({this.type, this.account, this.balance, this.cardNumber});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      type: json['type'],
      account: json['account'],
      balance: (json['balance'] as num).toDouble(),
      cardNumber: json['card_number'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['account'] = account;
    data['balance'] = balance;
    data['card_number'] = cardNumber;
    return data;
  }

  @override
  List<Object?> get props => [type, account, balance, cardNumber];
}
