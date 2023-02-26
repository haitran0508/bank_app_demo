import '../../../domain/entities/loan.dart';
import '../../models/loan.dart';
import '../mapper.dart';

class LoanMapper implements Mapper<LoanModel, Loan> {
  @override
  mapToEntity(model) {
    return Loan(
        number: model.accountNumber!,
        balance: model.balance!,
        rate: model.interestRate!,
        expiredDate: model.expiredDate!);
  }
}
