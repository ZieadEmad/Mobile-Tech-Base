import 'dart:developer';


import 'package:arch/core/exceptions/failure.dart';
import 'package:arch/core/extensions/dartz.dart';
import 'package:arch/core/use_cases/use_case.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repository/auth_repository.dart';

class SignInUseCase extends UseCase<void, SignInParams> {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SignInParams params) async {
    final result = await repository.signIn(params);
    if (result.isRight()) {
      final token = result.asRight();
    }
    return result;
  }
}

class SignInParams extends Equatable {
  final String codeOrEmail;
  final String password;
  final String userType;

  const SignInParams({
    required this.codeOrEmail,
    required this.password,
    required this.userType,
  });

  @override
  List<Object?> get props => [codeOrEmail, password,userType];
}
