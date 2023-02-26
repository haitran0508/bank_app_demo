import '../../domain/entities/account_summary.dart';
import '../../domain/repository/repository.dart';
import '../services/account_summary_service.dart';
import 'mappers/account_summary_mapper.dart';

class Repository extends RepositoryInterface {
  Repository({required this.service});

  final AccountSummayServiceInterface service;

  @override
  Future<AccountSummary> getAccountSummary() async {
    try {
      final accountModel = await service.getAccountSummary();

      final accountMapper = AccountMapper();

      final account = accountMapper.mapToEntity(accountModel);

      return account;
    } catch (e) {
      rethrow;
    }
  }
}
