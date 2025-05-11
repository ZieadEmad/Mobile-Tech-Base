import 'package:arch/core/data/repositories/base_repository_impl.dart';
import 'package:arch/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:arch/features/authentication/data/models/user_model.dart';
import 'package:arch/features/authentication/domain/entities/user_entity.dart';
import 'package:arch/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:arch/core/domain/entities/failure.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';

class AuthRepositoryImpl extends BaseRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(super._logger, {required this.remote});

  @override
  Future<Either<Failure, UserEntity>> signIn(SignInParams params) {
    return request(() {
      return request(() async {
        var response = await remote.signIn(params);
        UserModel user = UserModel.fromJson(response.data);
        return right(
          UserEntity(
            userId: user.userId,
            userName: user.userName,
            userEmail: user.userEmail,
            userToken: user.userToken,
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
