import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart' as intl;

import '../../../cores/icons/bank_app_icons_icons.dart';
import '../../../cores/theme/theme.dart';
import '../blocs/account_summary/account_summary_bloc.dart';
import '../blocs/account_summary/account_summary_events.dart';
import '../blocs/account_summary/account_summary_states.dart';
import '../widgets/avatar.dart';
import '../widgets/loan_card.dart';
import '../widgets/logo.dart';
import '../widgets/medium_card.dart';
import '../widgets/sell_buy_card.dart';
import '../widgets/small_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final accountSummaryBloc = GetIt.instance.get<AccountSummaryBloc>();
    accountSummaryBloc.add(AccountSummaryRequested());
    final safeTopPadding = MediaQuery.of(context).padding.top;
    const sidePadding = 20.0;

    final formatter = intl.NumberFormat.decimalPattern();

    final finances = [
      SmallCard(
        title: 'My bonuses',
        icon: BankAppIcons.icon,
        iconBackgroundColor: AppTheme.of(context)!.theme.amberBankColor,
      ),
      SmallCard(
        title: 'My budget',
        icon: BankAppIcons.wallet,
        iconBackgroundColor: AppTheme.of(context)!.theme.blueBankColor,
      ),
      SmallCard(
        title: 'My budget',
        icon: BankAppIcons.chart,
        iconBackgroundColor: AppTheme.of(context)!.theme.purpleBankColor,
      ),
    ];
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: safeTopPadding),
            child: SizedBox(
              height: 44,
              child: Stack(
                children: [
                  const Positioned(
                      left: 16,
                      top: 4,
                      child: Avatar(avatarPath: 'assets/images/avatar.png')),
                  Center(child: Logo()),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: sidePadding),
            alignment: Alignment.centerLeft,
            child: BlocBuilder<AccountSummaryBloc, AccountSummaryState>(
              bloc: accountSummaryBloc,
              builder: (context, state) {
                if (state is AccountSummaryLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is AccountSummaryError) {
                  return Center(child: Text(state.message));
                }
                state as AccountSummaryLoaded;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Balance',
                      style: AppTheme.of(context)!.theme.textB5.copyWith(
                          color: AppTheme.of(context)!.theme.textColorOnDark),
                    ),
                    Text(
                      '\$${formatter.format(state.account.balance)}',
                      style: AppTheme.of(context)!.theme.textH1.copyWith(
                          color: AppTheme.of(context)!.theme.textColorOnDark),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 170,
            child: BlocBuilder<AccountSummaryBloc, AccountSummaryState>(
              bloc: accountSummaryBloc,
              builder: (context, state) {
                if (state is AccountSummaryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is AccountSummaryError) {
                  return Center(child: Text(state.message));
                }
                state as AccountSummaryLoaded;
                final cards = state.account.cards;
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: sidePadding),
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    final currentCard = cards[index];
                    late List<Color> colors;
                    switch (index) {
                      case 0:
                        colors = AppTheme.of(context)!.theme.cardBlueGradient;
                        break;
                      case 1:
                        colors = AppTheme.of(context)!.theme.cardAmberGradient;
                        break;
                      case 2:
                        colors = AppTheme.of(context)!.theme.cardPurpleGradient;
                        break;
                      default:
                        colors = AppTheme.of(context)!.theme.cardBlueGradient;
                    }
                    return MediumCard(
                      cardTitle: currentCard.type,
                      accountTitle: currentCard.accountTitle,
                      balance: formatter.format(currentCard.balance),
                      number: currentCard.number,
                      gradients: colors,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 13),
                );
              },
            ),
          ),
          const SizedBox(height: 39),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: sidePadding),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'FINANCE',
                style: AppTheme.of(context)!.theme.textC4.copyWith(
                    color: AppTheme.of(context)!.theme.textColorOnDark),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: sidePadding),
              scrollDirection: Axis.horizontal,
              itemCount: finances.length,
              itemBuilder: (context, index) {
                return finances[index];
              },
              separatorBuilder: (context, index) => const SizedBox(width: 14),
            ),
          ),
          const SizedBox(height: 36),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: sidePadding),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppTheme.of(context)!.theme.smallCardBackgroundColor,
                    AppTheme.of(context)!.theme.blurPurpleColor,
                  ],
                  stops: const [
                    0.7,
                    0.95,
                  ]),
            ),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Row(
                  children: [
                    Icon(
                      Icons.expand_more,
                      color: AppTheme.of(context)!.theme.iconColorOnDark,
                    ),
                    Text(
                      'CURRENT LOANS',
                      style: AppTheme.of(context)!.theme.textC4.copyWith(
                            color: AppTheme.of(context)!.theme.textColorOnDark,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                BlocBuilder<AccountSummaryBloc, AccountSummaryState>(
                  bloc: accountSummaryBloc,
                  builder: (context, state) {
                    if (state is AccountSummaryLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is AccountSummaryError) {
                      return Center(child: Text(state.message));
                    }
                    state as AccountSummaryLoaded;
                    final loans = state.account.loans;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (var loan in loans)
                          LoanCard(
                            number: loan.number,
                            balance: '${loan.balance}',
                            rate: '${loan.rate}',
                            expiredDate: loan.expiredDate,
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 36),
                Row(
                  children: [
                    Icon(
                      Icons.expand_more,
                      color: AppTheme.of(context)!.theme.iconColorOnDark,
                    ),
                    Text(
                      'CURRENCIES AND METALS',
                      style: AppTheme.of(context)!.theme.textC4.copyWith(
                            color: AppTheme.of(context)!.theme.textColorOnDark,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                SellBuyCard(
                  items: [
                    SellBuyItem(
                        icon: BankAppIcons.usd_sign,
                        title: 'USD',
                        buy: '1000',
                        sell: '1300'),
                    SellBuyItem(
                        icon: BankAppIcons.eur_sign,
                        title: 'EUR',
                        buy: '1000',
                        sell: '1300')
                  ],
                ),
                const SizedBox(height: 12),
                SellBuyCard(
                  items: [
                    SellBuyItem(
                        icon: Icons.access_alarm,
                        title: 'USD',
                        buy: '1000',
                        sell: '1300'),
                    SellBuyItem(
                        icon: Icons.access_alarm,
                        title: 'EUR',
                        buy: '1000',
                        sell: '1300')
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
