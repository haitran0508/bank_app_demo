import 'package:flutter/material.dart';

import '../../../cores/theme/theme.dart';

class SellBuyItem {
  SellBuyItem(
      {required this.icon,
      required this.title,
      required this.buy,
      required this.sell});

  final IconData icon;
  final String title;
  final String buy;
  final String sell;
}

class SellBuyCard extends StatelessWidget {
  const SellBuyCard({super.key, required this.items});

  final List<SellBuyItem> items;

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppTheme.of(context)!.theme.textC2.copyWith(
          color: AppTheme.of(context)!.theme.iconColorOnDark,
        );
    final itemStyle = AppTheme.of(context)!.theme.textB5.copyWith(
          color: AppTheme.of(context)!.theme.textColorOnDark,
        );
    const priceSectionWidth = 83.0;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.of(context)!
            .theme
            .loanCardbackgroundColor
            .withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(26)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text('Currencies', style: labelStyle)),
              SizedBox(
                width: priceSectionWidth,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Buy', style: labelStyle)),
              ),
              SizedBox(
                width: priceSectionWidth,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Sell', style: labelStyle)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < items.length; i++) ...[
            if (i != 0) const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                    child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconBackgound(items[i].icon),
                    const SizedBox(width: 12),
                    Text(items[i].title, style: itemStyle),
                  ],
                )),
                SizedBox(
                  width: priceSectionWidth,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(items[i].buy, style: itemStyle)),
                ),
                SizedBox(
                  width: priceSectionWidth,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(items[i].sell, style: itemStyle)),
                ),
              ],
            ),
          ]
        ],
      ),
    );
  }
}

class IconBackgound extends StatelessWidget {
  const IconBackgound(
    this.icon, {
    super.key,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    const size = 20.0;
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: AppTheme.of(context)!.theme.blueBankColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Icon(
        icon,
        size: 10,
      ),
    );
  }
}
