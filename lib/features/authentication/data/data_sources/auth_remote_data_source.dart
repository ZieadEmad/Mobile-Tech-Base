import 'package:arch/core/exceptions/failure.dart';
import 'package:arch/features/authentication/data/models/user_model.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';
import 'package:dartz/dartz.dart';

abstract interface class AuthRemoteDataSource {
  Future<Either<Failure, Map<String,dynamic>>> signIn(SignInParams params);
}
