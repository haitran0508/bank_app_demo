import 'package:flutter/widgets.dart';

class Logo extends Image {
  Logo({super.key})
      : super.asset(
          'assets/images/logo.png',
          height: 21,
          width: 72,
        );
}
