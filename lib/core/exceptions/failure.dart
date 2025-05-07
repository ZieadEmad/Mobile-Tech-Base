import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<dynamic> properties;
  final Object? exceptionType;

  const Failure(
    this.exceptionType, [
    this.properties = const <dynamic>[],
  ]);

  @override
  List<Object?> get props => properties;
}

class ServerFailure extends Failure {
  final String? message;

  const ServerFailure(super.exceptionType, {this.message});
}

class ConnectionFailure extends Failure {
  final String? message;

  const ConnectionFailure(
    super.exceptionType, String string, {
    this.message = "We've lost Your Connection",
  });
}

class CacheFailure extends Failure {
  const CacheFailure(super.exceptionType);
}
