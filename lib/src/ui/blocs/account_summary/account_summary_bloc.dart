import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_account_summary.dart';
import 'account_summary_events.dart';
import 'account_summary_states.dart';

class AccountSummaryBloc
    extends Bloc<AccountSummaryEvent, AccountSummaryState> {
  final GetAccountSummary getAccountSummary;

  AccountSummaryBloc({required this.getAccountSummary})
      : super(AccountSummaryLoading()) {
    on<AccountSummaryRequested>((event, emit) async {
      try {
        emit(AccountSummaryLoading());
        final account = await getAccountSummary();

        emit(AccountSummaryLoaded(account: account));
      } catch (e) {
        emit(AccountSummaryError(e.toString()));
      }
    });
  }
}
