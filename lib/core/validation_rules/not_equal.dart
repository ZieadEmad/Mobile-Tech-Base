import 'package:arch/core/validation_rules/standard_validation_error.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class IsNotEqualParams extends Equatable {
  final String value1;

  final String value2;

  const IsNotEqualParams({required this.value1, required this.value2});

  @override
  List<Object?> get props => [value1, value2];
}

class NotEqualField
    extends FormzInput<IsNotEqualParams, StandardValidationError> {
  const NotEqualField.pure([
    super.isEqualParams = const IsNotEqualParams(value1: '', value2: ''),
  ]) : super.pure();

  const NotEqualField.dirty(super.isNotEqualParams) : super.dirty();

  /// it is accept a class of type [IsEqualParams]
  ///
  /// it contains [value1] and [value2] to validate if there are not equal
  @override
  StandardValidationError? validator(IsNotEqualParams params) {
    return params.value1 == params.value2
        ? StandardValidationError.invalid
        : null;
  }
}
