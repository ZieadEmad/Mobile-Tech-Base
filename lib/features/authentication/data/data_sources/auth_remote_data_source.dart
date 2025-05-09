import 'package:arch/core/core/data/network/utill/configration.dart';
import 'package:arch/features/authentication/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'auth_remote_data_source.g.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signIn({required String email, required String password});
}

@LazySingleton(as: AuthRemoteDataSource)
@RestApi(baseUrl: '')
abstract class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSourceImpl(Dio dio, Configuration configuration) {
    return _AuthRemoteDataSourceImpl(dio, baseUrl: configuration.getApiUrl);
  }

  @override
  @POST('mobile/api/auth/login')
  Future<UserModel> signIn({
    @Field() required String email,
    @Field() required String password,
  });
}