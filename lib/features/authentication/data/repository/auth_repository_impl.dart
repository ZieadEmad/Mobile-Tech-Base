import 'package:arch/core/exceptions/exceptions.dart';
import 'package:arch/features/authentication/data/models/user_model.dart';
import 'package:arch/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:arch/core/exceptions/failure.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';

import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModel>> signIn(SignInParams params) async {
    final response = await remoteDataSource.signIn(params);
    return response.fold(
          (failure) => Left(failure),
          (json) {
        try {
          UserModel user = UserModel.fromJson(json) ?? UserModel.empty();
          return Right(user);
        } catch (e) {
          return const Left(ServerFailure(ExceptionType.normal));
        }
      },
    );
  }
}