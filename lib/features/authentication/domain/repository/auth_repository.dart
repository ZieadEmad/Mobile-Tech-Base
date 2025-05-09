import 'package:arch/features/authentication/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/core/domain/entities/failure.dart';
import '../use_cases/sign_in_use_case.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signIn(SignInParams params);
}