import 'package:arch/core/validation_rules/not_empty_rule.dart';
import 'package:formz/formz.dart';

class SignInFormValidation with FormzMixin {
  NotEmptyField emailOrCode;
  NotEmptyField password;
  NotEmptyField userType;

  SignInFormValidation({
    this.emailOrCode = const NotEmptyField.pure(),
    this.password = const NotEmptyField.pure(),
    this.userType = const NotEmptyField.pure(),
  });

  @override
  List<FormzInput> get inputs => [
        emailOrCode,
        password,
         userType,
      ];
}
