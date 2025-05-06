enum Flavor { development, production, staging }

class BuildConfig {
  factory BuildConfig() {
    _instance ??= BuildConfig.of();
    return _instance!;
  }

  BuildConfig._({
    required this.baseURL,
    required this.baseImageUrl,
  });

  factory BuildConfig.of() {
    if (_instance != null) return _instance!;
    switch (flavor) {
      case Flavor.development:
        _instance = BuildConfig._development();
      case Flavor.production:
        _instance = BuildConfig._production();
      case Flavor.staging:
        _instance = BuildConfig._staging();
    }
    return _instance!;
  }

  factory BuildConfig._production() {
    return BuildConfig._(
      baseURL: 'https://api',
      baseImageUrl:
          'https://s3.eu-central-1.amazonaws.com/',
    );
  }

  factory BuildConfig._development() {
    return BuildConfig._(
      baseURL: 'https://api',
      baseImageUrl:
          'https://s3.eu-central-1.amazonaws.com/',
    );
  }

  factory BuildConfig._staging() {
    return BuildConfig._(
      baseURL: 'https://api',
      baseImageUrl:
      'https://s3.eu-central-1.amazonaws.com/',
    );
  }

  void copyWith() {
    final instance = BuildConfig.of();
    final updatedInstance = BuildConfig._(
      baseURL: instance.baseURL,
      baseImageUrl: instance.baseImageUrl,
    );
    _instance = updatedInstance;
  }

  static BuildConfig? _instance;

  static Flavor flavor = Flavor.production;
  final String baseURL;
  final String baseImageUrl;
}

//flutter build apk --release --target lib/main_production.dart to get apk development