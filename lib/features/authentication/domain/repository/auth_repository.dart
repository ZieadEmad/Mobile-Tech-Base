import 'package:arch/features/authentication/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/exceptions/failure.dart';
import '../use_cases/sign_in_use_case.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> signIn(SignInParams params);
}