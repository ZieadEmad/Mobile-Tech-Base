import 'package:arch/core/domain/entities/failure.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInUseCase) : super(SignInInitial());
  final SignInUseCase _signInUseCase;
  Future<void> signIn(
    String emailOrCode,
    String password,
    String userType,
  ) async {
    emit(SignInLoading());
    final result = await _signInUseCase(
      SignInParams(
        codeOrEmail: emailOrCode,
        password: password,
        userType: userType,
      ),
    );
    result.fold(
      (e) {
        emit(SignInFailed(e));
      },
      (_) {
        emit(SignInSuccess());
      },
    );
  }
}
