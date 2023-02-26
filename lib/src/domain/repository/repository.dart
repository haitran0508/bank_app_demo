import '../entities/account_summary.dart';

abstract class RepositoryInterface {
  Future<AccountSummary> getAccountSummary();
}
