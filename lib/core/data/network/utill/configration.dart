import 'package:injectable/injectable.dart';

class AppEnvironment {
  /// name of the environment
  final String name;

  /// default constructor
  const AppEnvironment(this.name);

  /// preset of common env name 'dev'
  static const dev = 'dev';

  /// preset of common env name 'prod'
  static const prod = 'prod';

  /// preset of common env name 'staging'
  static const staging = 'staging';
}

abstract class Configuration {
  String get name;

  String get getBaseUrl;

  String get getApiUrl;

  String get getAssetUrl;
}

@LazySingleton(as: Configuration, env: [AppEnvironment.dev])
class DevConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://supply-ways.com';

  @override
  String get name => 'development';

  @override
  String get getApiUrl => '$getBaseUrl/';

  @override
  String get getAssetUrl => 'https://supply-ways.com';
}

@LazySingleton(as: Configuration, env: [AppEnvironment.staging])
class StagingConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://supply-ways.com';

  @override
  String get name => 'staging';

  @override
  String get getApiUrl => getBaseUrl;

  @override
  String get getAssetUrl => 'https://supply-ways.com';
}

@LazySingleton(as: Configuration, env: [AppEnvironment.prod])
class ProdConfiguration implements Configuration {
  @override
  String get getBaseUrl => 'https://supply-ways.com';

  @override
  String get name => 'production';

  @override
  String get getApiUrl => '$getBaseUrl/';

  @override
  String get getAssetUrl => 'https://supply-ways.com';
}
