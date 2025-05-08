import 'dart:developer';

import 'package:dio/dio.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("=======================================");
    log("Error");
    log("path:=> ${err.requestOptions.path}");
    log("error:=> ${err.error}");
    log("message:=> ${err.message}");
    log("message:=> ${err.response?.data}");
    log("=======================================");
    // if (response.statusCode == 401 ||
    //     response.data.contains("unauthorized")) {
    //   preferences.clear();
    //   navigatorKey.currentContext!.goNamed(Routes.login);
    // }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = "FROM FLUTTER SECURED STORAGE";
    options.headers["Authorization"] = "Bearer $token";
    log("=======================================");
    log("Request");
    log("url:=> ${options.path}");
    log("content:=> ${options.contentType}");
    // ignore: unnecessary_null_comparison
    log("headers:=> hasToken:${token != null}");
    log("queryParameters:=> ${options.queryParameters}");
    log("body:=> ${options.data != null ? options.data! : "Data is null"}");
    log("=======================================");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("=======================================");
    log("Response:");
    log("url:=> ${response.requestOptions.path}");
    log("statusCode:=> ${response.statusCode}");
    log("body:=> hasData: ${response.data != null}");
    log("=======================================");

    handler.next(response);
  }
}
