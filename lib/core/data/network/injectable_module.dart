import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectableModule {
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();

  @lazySingleton
  Dio get dioInstance {
    final dio = Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Connection': 'Keep-Alive',
        },
        validateStatus: (statusCode) {
          if (statusCode != null) {
            if (200 <= statusCode && statusCode < 300) {
              return true;
            } else {
              return false;
            }
          } else {
            return false;
          }
        },
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async {
          // Map<String, String> headers;
          // final failureOrToken = getIt<AuthCubit>().getCurrentUser();
          // final token = (await failureOrToken)?.accessToken;
          // request.headers.addAll();

          // if (token != null) {
          //   headers = {'Authorization': 'Bearer ${token}'};
          //   request.headers.addAll(headers);
          // }
          // if(currentUser?.value.user?.id==26){
          //   slack.send('${counter2++} ${request.method} ${request.uri}');
          // }
          // slack.send(message)
          request
            ..sendTimeout =
                (request.data is FormData)
                    ? const Duration(milliseconds: 30000000)
                    : const Duration(milliseconds: 6000000)
            ..connectTimeout = const Duration(milliseconds: 6000000)
            ..receiveTimeout = const Duration(milliseconds: 6000000);
          return handler.next(request);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        logPrint: (obj) {
          debugPrint(obj.toString());
        },
      ),
    );
    dio.interceptors.add(CurlLoggerDioInterceptor());
    // dio.interceptors.add(RequestsInterceptor());
    return dio;
  }

  @lazySingleton
  Logger get logger => Logger();
}
