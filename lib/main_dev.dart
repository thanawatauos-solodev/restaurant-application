import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/core/config/app_config.dart';
import 'package:restaurant_application/core/config/dev_config.dart';
import 'package:restaurant_application/main.dart';

void main() async {
  AppConfig.initialize(DevConfig());

  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: MainApp()));
}
