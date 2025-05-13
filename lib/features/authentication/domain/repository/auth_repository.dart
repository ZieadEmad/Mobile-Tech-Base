import 'package:arch/core/domain/entities/failure.dart';
import 'package:arch/features/authentication/data/models/user_model.dart';
import 'package:arch/features/authentication/domain/entities/user_entity.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signIn(SignInParams params);
}