import 'package:equatable/equatable.dart';

abstract class AccountSummaryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AccountSummaryRequested extends AccountSummaryEvent {
  AccountSummaryRequested();

  @override
  List<Object> get props => [];
}
