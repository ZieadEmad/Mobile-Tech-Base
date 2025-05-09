import 'package:arch/core/core/domain/entities/failure.dart';
import 'package:arch/core/core/domain/use_cases/use_case.dart';
import 'package:arch/features/authentication/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInUseCase extends UseCase<void, SignInParams> {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SignInParams params) async {
    return repository.signIn(params);
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
  List<Object?> get props => [codeOrEmail, password, userType];
}
