import '../entities/account_summary.dart';
import '../repository/repository.dart';

class GetAccountSummary {
  GetAccountSummary(this.repository);

  final RepositoryInterface repository;

  Future<AccountSummary> call() async {
    try {
      final account = repository.getAccountSummary();
      return account;
    } catch (e) {
      rethrow;
    }
  }
}
