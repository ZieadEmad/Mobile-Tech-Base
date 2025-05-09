import 'package:arch/core/core/domain/entities/failure.dart';
import 'package:dartz/dartz.dart';

typedef FutureEitherFailureOrData<T> = Future<Either<Failure, T>> Function();

abstract class BaseRepository {
  Future<Either<Failure, T>> request<T>(FutureEitherFailureOrData<T> body);
}
