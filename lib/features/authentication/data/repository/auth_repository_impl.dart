import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/network/dio/dio.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/use_cases/sign_in_use_case.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModel>> signIn(SignInParams params) async {
    final response = await remoteDataSource.signIn(params);

    try {
      //Whatever the BE returns like in validation to show it to the user
      if (response.error != null) return response.error['message'];
      UserModel user = UserModel.fromJson(response.data) ?? UserModel.empty();
      return Right(user);
    } on DioException catch (e) {
      return Left(DioExceptionHandler.handle(e));
    } catch (e) {
      return Left(ServerFailure(ExceptionType.normal,message: e.toString()));
    }
  }
}
