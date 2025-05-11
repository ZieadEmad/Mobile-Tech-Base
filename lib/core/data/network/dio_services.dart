import 'dart:async';
import 'package:arch/core/data/network/utill/build_config.dart'
    show BuildConfig;
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';

enum HttpMethod {
  get('GET'),
  post('POST'),
  put('PUT'),
  patch('PATCH'),
  delete('DELETE');

  const HttpMethod(this.method);

  final String method;
}

abstract interface class NetworkService {
  Future<void> init();

  Future<Response<dynamic>> request(
    String path, {
    required HttpMethod httpMethod,
    Map<String, dynamic>? data,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool withoutToken = false,
    bool withStudentId = false,
  });
}

class DioService implements NetworkService {
  DioService(this._dio);

  final Dio _dio;

  @override
  Future<void> init() async {
    const timeout = Duration(minutes: 1);
    final options = BaseOptions(
      baseUrl: BuildConfig.of().baseURL,
      connectTimeout: timeout,
      receiveTimeout: timeout,
      followRedirects: false,
      receiveDataWhenStatusError: true,
      validateStatus: (status) {
        return (status ?? 501) <= 500;
      },
    );
    _dio.options = options;
    _dio.interceptors.add(CurlLoggerDioInterceptor());
  }

  @override
  Future<Response<dynamic>> request(
    String path, {
    required HttpMethod httpMethod,
    Map<String, dynamic>? data,
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool withoutToken = false,
    bool withStudentId = false,
  }) async {
    final options = Options(
      method: httpMethod.method,
      headers: {'Content-Type': 'application/json'},
    );
    late Response<dynamic> response;
    // final crashReportingService = getIt<CrashReportingService>();
    try {
      response = await _dio.request<dynamic>(
        path,
        data: data ?? formData,
        onReceiveProgress: onReceiveProgress,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        options: options,
        queryParameters: queryParameters,
      );
      if ((response.statusCode ?? 0) >= 400) {
        // unawaited(
        //   crashReportingService.captureException(
        //     'Exception within the api with path: $path, statusMessage: '
        //         '${response.statusMessage}, statusCode: ${response.statusCode}',
        //   ),
        // );
      }
    } catch (error) {
      // unawaited(
      //   crashReportingService.captureException(
      //     error,
      //     stackTrace: stackTrace,
      //     message: {
      //       'apiPath': path,
      //       'statusMessage': response.statusMessage,
      //       'statusCode': response.statusCode,
      //     }.toString(),
      //   ),
      // );
    }

    return response;
  }
}
