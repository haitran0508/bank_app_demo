import 'package:equatable/equatable.dart';

import '../../../domain/entities/account_summary.dart';

abstract class AccountSummaryState extends Equatable {
  @override
  List<Object> get props => [];
}

class AccountSummaryLoading extends AccountSummaryState {}

class AccountSummaryLoaded extends AccountSummaryState {
  final AccountSummary account;

  AccountSummaryLoaded({required this.account});

  @override
  List<Object> get props => [account];
}

class AccountSummaryError extends AccountSummaryState {
  final String message;

  AccountSummaryError(this.message);

  @override
  List<Object> get props => [message];
}
