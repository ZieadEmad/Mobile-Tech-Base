import 'package:dartz/dartz.dart';


extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right<L, R>).value;

  L asLeft() => (this as Left<L, R>).value;

  /// [getRightOrNull] returns right when the value is right,
  /// otherwise returns null.
  R? getRightOrNull() => isRight() ? asRight() : null;
}

