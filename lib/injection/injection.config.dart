// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:arch/core/data/network/injectable_module.dart' as _i800;
import 'package:arch/core/data/network/utill/configration.dart' as _i512;
import 'package:arch/features/authentication/data/data_sources/auth_remote_data_source.dart'
    as _i162;
import 'package:arch/features/authentication/data/repository/auth_repository_impl.dart'
    as _i203;
import 'package:arch/features/authentication/domain/repository/auth_repository.dart'
    as _i921;
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart'
    as _i1;
import 'package:arch/features/authentication/presentation/manager/sign_in/sign_in_cubit.dart'
    as _i555;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _staging = 'staging';
const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i974.Logger>(() => injectableModule.logger);
    gh.lazySingleton<_i512.Configuration>(
      () => _i512.StagingConfiguration(),
      registerFor: {_staging},
    );
    gh.lazySingleton<_i512.Configuration>(
      () => _i512.DevConfiguration(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i512.Configuration>(
      () => _i512.ProdConfiguration(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i162.AuthRemoteDataSource>(
        () => _i162.AuthRemoteDataSourceImpl(
              gh<_i361.Dio>(),
              gh<_i512.Configuration>(),
            ));
    gh.lazySingleton<_i921.AuthRepository>(() => _i203.AuthRepositoryImpl(
          gh<_i974.Logger>(),
          remote: gh<_i162.AuthRemoteDataSource>(),
        ));
    gh.lazySingleton<_i1.SignInUseCase>(
        () => _i1.SignInUseCase(gh<_i921.AuthRepository>()));
    gh.factory<_i555.SignInCubit>(
        () => _i555.SignInCubit(gh<_i1.SignInUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i800.InjectableModule {}
