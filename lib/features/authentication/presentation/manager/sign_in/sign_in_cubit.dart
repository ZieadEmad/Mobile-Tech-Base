import 'package:arch/core/exceptions/errors/sign_in_error.dart';
import 'package:arch/core/validation_rules/not_empty_rule.dart';
import 'package:arch/features/authentication/domain/form/sign_in_form_validation.dart';
import 'package:arch/features/authentication/domain/use_cases/sign_in_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInUseCase) : super(SignInInitial());
  final SignInUseCase _signInUseCase;
  final signInForm = SignInFormValidation();

  void validate() {
    if (Formz.validate(signInForm.inputs)) {
      signIn();
      return;
    }
    signInForm.emailOrCode = NotEmptyField.dirty(signInForm.emailOrCode.value);
    signInForm.password = NotEmptyField.dirty(signInForm.password.value);
    signInForm.userType = NotEmptyField.dirty(signInForm.userType.value);

    emit(SignInFormInValid());
  }

  Future<void> signIn() async {
    emit(SignInLoading());
    final result = await _signInUseCase(
      SignInParams(
        codeOrEmail: signInForm.emailOrCode.value,
        password: signInForm.password.value,
        userType: signInForm.userType.value,
      ),
    );

    result.fold(
      (e) {
        if (e.exceptionType is SignInErrors) {
          switch (e.exceptionType) {
            case SignInErrors.needsActivation:
              emit(SignInFailed('error'));
              return;
          }
        }
        emit(SignInFailed('error'));
      },
      (_) {
        emit(SignInSuccess());
      },
    );
  }
}
