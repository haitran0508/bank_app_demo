import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../src/data/repository/repository.dart';
import '../../src/data/services/account_summary_service.dart';
import '../../src/domain/usecases/get_account_summary.dart';
import '../../src/ui/blocs/account_summary/account_summary_bloc.dart';

class DependenciesConfigurator {
  static void configDependencies() {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton<http.Client>(() => http.Client());

    getIt.registerLazySingleton<AccountSummayServiceInterface>(
        () => AccountSummayService());

    getIt.registerLazySingleton<Repository>(
        () => Repository(service: getIt.get<AccountSummayServiceInterface>()));

    getIt.registerLazySingleton<GetAccountSummary>(
        () => GetAccountSummary(getIt.get<Repository>()));

    getIt.registerLazySingleton<AccountSummaryBloc>(
      () =>
          AccountSummaryBloc(getAccountSummary: getIt.get<GetAccountSummary>()),
    );
  }
}
