import 'package:restaurant_application/core/config/config.dart';

class AppConfig {
  final EnvConfig config;

  AppConfig(this.config);

  static late AppConfig instance;

  static void initialize(EnvConfig config) {
    instance = AppConfig(config);
  }
}