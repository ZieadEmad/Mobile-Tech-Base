import 'dart:convert';

import 'package:arch/core/constans/remote_urls.dart';
import 'package:arch/core/exceptions/errors/sign_in_error.dart';
import 'package:arch/core/exceptions/exceptions.dart';
import 'package:arch/core/exceptions/failure.dart';
import 'package:arch/core/network/dio_service.dart';
import 'package:arch/features/authentication/data/models/user_model.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';
import 'package:dartz/dartz.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkService _networkService;

  AuthRemoteDataSourceImpl(this._networkService);

  @override
  Future<Either<Failure, Map<String,dynamic>>> signIn(SignInParams params) async {
    try {


      final response = await _networkService.request(
        RemoteURLs.loginPath,
        httpMethod: HttpMethod.post,
        data: {
          "username": params.codeOrEmail,
          "password": params.password,
        },
      );
      final data = response.data as Map<String, dynamic>;
      if (data['user'] is Map<String, dynamic> &&
          (data['user'] as Map<String, dynamic>)['active'].toString() == "0") {
        return const Left(
          ServerFailure(SignInErrors.needsActivation),
        );
      }
      final userToken = data['sessionToken'];
      if (userToken != null) {
        return Right(response.data);
      }
      return const Left(ServerFailure(ExceptionType.normal));
    } catch (e) {
      return const Left(ServerFailure(ExceptionType.normal));
    }
  }


}
