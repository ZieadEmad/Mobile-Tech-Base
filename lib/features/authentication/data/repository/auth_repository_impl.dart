import 'package:arch/core/data/repositories/base_repository_impl.dart';
import 'package:arch/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:arch/features/authentication/domain/entities/user_entity.dart';
import 'package:arch/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:arch/core/domain/entities/failure.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends BaseRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(super._logger, {required this.remote});

  @override
  Future<Either<Failure, UserEntity>> signIn(SignInParams params) {
    return request(() {
      return request(() async {
        var userResponse = await remote.signIn(
          email: params.codeOrEmail,
          password: params.password,
        );
        return right(
          UserEntity(
            userId: userResponse.userId,
            userName: userResponse.userName,
            userEmail: userResponse.userEmail,
            userToken: userResponse.userToken,
          ),
        );
      });
    });
  }

  // @override
  // Future<Either<Failure, UserModel>> signIn(SignInParams params) async {
  //   final response = await remoteDataSource.signIn(params);
  //   return response.fold(
  //         (failure) => Left(failure),
  //         (json) {
  //       try {
  //         UserModel user = UserModel.fromJson(json) ?? UserModel.empty();
  //         return Right(user);
  //       } catch (e) {
  //         return const Left(ServerFailure(ExceptionType.normal));
  //       }
  //     },
  //   );
  // }
}
