import 'package:arch/core/domain/entities/enum/server_error_code.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final ServerErrorCode errorCode;
  final String message;

  ServerFailure({required this.errorCode, this.message = ''});
}

class NetworkFailure implements Failure {
  final bool connectionTimeOut;

  NetworkFailure({this.connectionTimeOut = false});
}

// class ConnectionFailure implements Failure {
//   final String? message;
//
//   const ConnectionFailure(
//       super.exceptionType, String string, {
//         this.message = "We've lost Your Connection",
//       });
// }

class LocalAuthFailure implements Failure {}
