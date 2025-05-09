import 'dart:convert';
import 'dart:io';
import 'package:arch/core/domain/entities/failure.dart';
import 'package:arch/core/domain/repositories/base_repository.dart';
import 'package:arch/core/domain/entities/enum/server_error_code.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../models/base_response/base_response.dart';

class BaseRepositoryImpl implements BaseRepository {
  // Logger for logging errors and messages
  final Logger _logger;

  // Constructor that injects a Logger instance
  BaseRepositoryImpl(this._logger);

  @override
  // Executes a request with error handling and logging
  Future<Either<Failure, T>> request<T>(
    FutureEitherFailureOrData<T> body,
  ) async {
    try {
      // Execute the request body and return the result
      return await body();
    } catch (e) {
      // Handle DioExceptions (network-related errors)
      if (e is DioException) {
        // const connectionTimeout = 'connectionTimeout';
        if (e.error is SocketException) {
          // Return a NetworkFailure for socket errors
          return left(NetworkFailure());
        } else if (e.type == DioExceptionType.connectionTimeout) {
          return left(NetworkFailure(connectionTimeOut: true));
        }
        // Log DioException details
        _logger.e(e.message, error: e, stackTrace: e.stackTrace);

        var message = ''; // Error message from server
        var errorCode = ServerErrorCode.serverError; // Default error code

        if (e.response != null) {
          // Extract error code from HTTP status code
          errorCode = _getErrorCode(e.response!.statusCode ?? 500);

          try {
            // Parse error message from response data if possible
            final responseData =
                e.response!.data is String
                    ? jsonDecode(e.response!.data)
                    : e.response!.data;
            final baseResponse = BaseResponse.fromJson(
              responseData,
              (_) => null,
            );
            message = baseResponse.error?.message ?? '';
          } catch (e) {
            // Return ServerFailure with available information
            return left(ServerFailure(errorCode: errorCode, message: message));
          }
        }

        // Return ServerFailure with extracted error details
        return left(ServerFailure(errorCode: errorCode, message: message));
      } else if (e is Error) {
        // Log other errors
        _logger.e(e.toString(), error: e, stackTrace: e.stackTrace);
      } else {
        // Log unexpected errors
        _logger.e(e);
      }

      // Return ServerFailure as a fallback for unhandled errors
      return left(ServerFailure(errorCode: ServerErrorCode.serverError));
    }
  }

  // Maps HTTP status codes to ServerErrorCodes
  ServerErrorCode _getErrorCode(int statusCode) {
    switch (statusCode) {
      case 401:
        return ServerErrorCode.unauthenticated;
      case 404:
        return ServerErrorCode.notFound;
      case 403:
        return ServerErrorCode.forbidden;
      case 422:
        return ServerErrorCode.wrongInput;
      default:
        return ServerErrorCode.serverError;
    }
  }
}
