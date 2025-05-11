import 'package:arch/features/authentication/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:arch/features/authentication/presentation/manager/sign_in/sign_in_cubit.dart';
import 'package:arch/injection/injection.dart';

import 'data/data_sources/auth_remote_data_source.dart';
import 'data/repository/auth_repository_impl.dart';
import 'domain/repository/auth_repository.dart';
import 'domain/use_cases/sign_in_use_case.dart';

class AuthDI {
  void init() {
    final sl = InjectionContainer.locator;
    // 💼 Presentation Layer
    sl.registerFactory(() => SignInCubit(sl()));

    // 📦 Domain Layer - Use Cases
    sl.registerLazySingleton(() => SignInUseCase(sl()));

    // 🌐 Data Layer - Data Sources
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()),
    );
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()),
    );

    // 📦 Data Layer - Repository Implementation
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), remote: sl()),
    );
  }
}
