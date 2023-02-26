import 'package:flutter/material.dart';

import 'cores/dependencies_cofig/dependencies_config.dart';
import 'src/bank_demo_app.dart';

void main() {
  DependenciesConfigurator.configDependencies();
  runApp(const BankDemoApp());
}
