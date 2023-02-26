import '../../../cores/theme/theme.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.avatarPath});

  final String avatarPath;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppTheme.of(context)!.theme.primaryColor,
        ),
        child: Image.asset(
          avatarPath,
          height: 32,
          width: 32,
        ),
      ),
    );
  }
}
