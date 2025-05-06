import 'package:arch/core/validation_rules/standard_validation_error.dart';
import 'package:formz/formz.dart';

class NotEmptyField extends FormzInput<String, StandardValidationError> {
  const NotEmptyField.pure([super.value = '']) : super.pure();

  const NotEmptyField.dirty(String? value) : super.dirty(value ?? "");

  @override
  StandardValidationError? validator(String? value) {
    return value != null && value.isNotEmpty
        ? null
        : StandardValidationError.invalid;
  }
}
