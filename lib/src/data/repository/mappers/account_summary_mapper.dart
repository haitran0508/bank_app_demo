import '../../../domain/entities/account_summary.dart';
import '../../../domain/entities/card.dart';
import '../../../domain/entities/loan.dart';
import '../../models/account.dart';
import '../mapper.dart';
import 'card_mapper.dart';
import 'loan_mapper.dart';

class AccountMapper implements Mapper<AccountModel, AccountSummary> {
  @override
  mapToEntity(model) {
    var cards = <Card>[];
    var loans = <Loan>[];
    if (model.cards != null) {
      final cardMapper = CardMapper();
      final models = model.cards!;
      cards = models.map((item) => cardMapper.mapToEntity(item)).toList();
    }

    if (model.loans != null) {
      final loanMapper = LoanMapper();
      final models = model.loans!;
      loans = models.map((item) => loanMapper.mapToEntity(item)).toList();
    }
    return AccountSummary(balance: model.balance!, cards: cards, loans: loans);
  }
}
