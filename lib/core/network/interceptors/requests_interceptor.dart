import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class RequestsInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger().d('onRequest:: path: ${options.path}, data: ${options.data}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger().d(
      'onResponse:: statusCode: ${response.statusCode}, data: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Logger().e(
      'onError:: error: ${err.error}, message: ${err.message}, stackTrace: ${err.stackTrace}',
    );
    super.onError(err, handler);
  }
}
