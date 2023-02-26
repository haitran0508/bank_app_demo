import 'package:flutter/material.dart';

import '../../../cores/theme/theme.dart';

class SmallCard extends StatelessWidget {
  const SmallCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.iconBackgroundColor});

  final IconData icon;
  final Color iconBackgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    const size = 100.0;
    const iconSize = 32.0;
    const padding = 16.0;
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.only(
        left: padding,
        top: padding,
        right: padding,
      ),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppTheme.of(context)!.theme.smallCardBackgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(26)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: iconSize,
            width: iconSize,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Icon(icon, size: 16),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: AppTheme.of(context)!
                .theme
                .textC3
                .copyWith(color: AppTheme.of(context)!.theme.textColorOnDark),
          ),
        ],
      ),
    );
  }
}
