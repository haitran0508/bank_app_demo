import '../../../domain/entities/card.dart';
import '../../models/card.dart';
import '../mapper.dart';

class CardMapper implements Mapper<CardModel, Card> {
  @override
  mapToEntity(model) {
    return Card(
        accountTitle: model.account!,
        type: model.type!,
        balance: model.balance!,
        number: model.cardNumber!);
  }
}
