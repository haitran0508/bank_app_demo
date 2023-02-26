import 'package:flutter/material.dart';

import '../../../cores/icons/bank_app_icons_icons.dart';
import '../../../cores/theme/theme.dart';
import 'bag_screen.dart';
import 'card_screen.dart';
import 'chat_screen.dart';
import 'home_screen.dart';
import 'time_screen.dart';

class TabViewScreen extends StatefulWidget {
  const TabViewScreen({super.key});

  @override
  State<TabViewScreen> createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen>
    with TickerProviderStateMixin {
  late final _controller;

  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final safeBottomPadding = MediaQuery.of(context).padding.bottom;
    const iconSize = 15.0;
    return Scaffold(
      backgroundColor: AppTheme.of(context)!.theme.secondaryColor,
      body: Column(
        children: [
          Expanded(
              child: TabBarView(
            controller: _controller,
            children: const [
              HomeScreen(),
              BagScreen(),
              CardScreen(),
              ChatScreen(),
              TimeScreen()
            ],
          )),
          Container(
            height: 82,
            padding: EdgeInsets.only(bottom: safeBottomPadding),
            decoration: BoxDecoration(
              color: AppTheme.of(context)!.theme.bottomBarColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: TabBar(
              controller: _controller,
              indicator:
                  const UnderlineTabIndicator(borderSide: BorderSide(width: 0)),
              tabs: const <Widget>[
                Tab(
                  icon: Icon(
                    BankAppIcons.home,
                    size: iconSize,
                  ),
                ),
                Tab(
                  icon: Icon(
                    BankAppIcons.bag,
                    size: iconSize,
                  ),
                ),
                Tab(
                  icon: Icon(
                    BankAppIcons.card,
                    size: iconSize,
                  ),
                ),
                Tab(
                  icon: Icon(
                    BankAppIcons.chat,
                    size: iconSize,
                  ),
                ),
                Tab(
                  icon: Icon(
                    BankAppIcons.time,
                    size: iconSize,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
