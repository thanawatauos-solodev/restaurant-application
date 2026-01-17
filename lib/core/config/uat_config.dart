import 'package:restaurant_application/core/config/config.dart';

class UatConfig implements EnvConfig {
  final String _environmentName = "DEV";

  @override
  String get environmentName => _environmentName;
}
