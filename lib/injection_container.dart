import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'core/network/dio/dio.dart';
import 'core/network/dio_service.dart';

class InjectionContainer {
  static GetIt locator = GetIt.instance;

  InjectionContainer._();
}

Future<void> setupLocator() async {
  // Shared
  _registerSharedSingletons();

  // Register services here
  // AuthDI().init();

  // Register data sources
  _registerDataSources();

  // Register repositories
  _registerRepositories();

  // cubits
  _registerFactoryCubits();
  
  //use cases
  _registerUsecases();
}

Future<void> _registerSharedSingletons() async {
  final sl = InjectionContainer.locator;

  sl.registerLazySingleton<NetworkService>(() => DioService(sl()));

  /// -------------------------------------------------
  /// Initialize storage and register it as a singleton.
  // final FlutterSecuredStorage  storage = .....;

  // Configuration options for Dio.
  BaseOptions options = BaseOptions(
    baseUrl: "", // Base URL for API requests.
    followRedirects: false, // Disables following redirects automatically.
    headers: {
      'Content-Type': 'application/json', // Default content type for requests.
    },
    connectTimeout: const Duration(seconds: 10), // Connection timeout.
    receiveTimeout: const Duration(seconds: 10), // Response timeout.
  );

  // Registering singletons.

  // Register Dio instance with custom configurations and interceptors.
  sl.registerSingleton<BaseDio>(
    DioClient(
      options: options, // Pass the custom options defined above.
      interceptors: [DioInterceptor()], // List of interceptors.
      dio: Dio(), // Dio instance.
    ),
  );
}

void _registerUsecases() {}

void _registerFactoryCubits() {}

void _registerRepositories() {}

void _registerDataSources() {}
