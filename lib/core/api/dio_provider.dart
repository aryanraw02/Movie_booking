/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 23:26:52
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/helpers/log_helpers.dart';
import 'package:dio/dio.dart';

///
/// Provider to configure and return a Dio instance.
///
class DioProvider {
  static Dio instance() {
    final dio = Dio();

    // dio.interceptors.add(AuthInterceptor()); // (Commented) Can be used for authentication handling.
    dio.interceptors.add(HttpLogInterceptor()); // custom log iterceptor

    return dio;
  }
}

/// HTTP interceptor to log requests, responses, and errors.
class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String logMessage = "onRequest: ${options.uri}";

    if (options.data != null && options.data.toString().isNotEmpty) {
      logMessage += "\ndata=${options.data}";
    }
    if (options.method.isNotEmpty) {
      logMessage += "\nmethod=${options.method}";
    }
    if (options.headers.isNotEmpty) {
      logMessage += "\nheaders=${options.headers}";
    }
    if (options.queryParameters.isNotEmpty) {
      logMessage += "\nqueryParameters=${options.queryParameters}";
    }

    if (logMessage.isNotEmpty) {
      LogHelper.info(tag: "HttpLogInterceptor", message: logMessage);
    }

    handler.next(options);
  }

  /// Intercepts and logs the HTTP response details.
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LogHelper.debug(
      tag: "HttpLogInterceptor",
      message: "statusCode=${response.statusCode}\n",
      // "responseBody=${response.data}",
    );

    super.onResponse(response, handler);
  }

  /// Intercepts and logs any errors occurring during the HTTP request.
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LogHelper.error(
      tag: "HttpLogInterceptor",
      message:
          "onError: $err\n"
          "Response: ${err.response}",
    );

    super.onError(err, handler);
  }
}

/// Interceptor for handling authentication, adding tokens, and refreshing them if expired.
class AuthInterceptor extends Interceptor {
  String? _accessToken = "your_access_token";

  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    LogHelper.debug(
      tag: "AuthInterceptor",
      message: "Adding Authorization token...",
    );

    if (_accessToken != null) {
      options.headers["Authorization"] =
          "Bearer $_accessToken"; // Attach token to request headers.
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LogHelper.debug(
      tag: "AuthInterceptor",
      message:
          "Response received: ${response.statusCode}", // Log HTTP response status.
    );

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    LogHelper.debug(
      tag: "AuthInterceptor",
      message: "Error occurred: ${err.response?.statusCode}",
    );

    if (err.response?.statusCode == 401) {
      // Check if the error is due to token expiration.
      LogHelper.debug(
        tag: "AuthInterceptor",
        message: "Token expired, refreshing token...",
      );

      try {
        _accessToken = await _refreshToken(); // Refresh the token.
        if (_accessToken != null) {
          final retryRequest = await _retryRequest(
            err.requestOptions,
          ); // Retry the failed request.
          return handler.resolve(retryRequest);
        }
      } catch (e) {
        LogHelper.error(
          tag: "AuthInterceptor",
          message: "Refresh token failed: $e",
        );
      }
    }

    handler.next(err); // Continue error handling if not resolved.
  }

  /// Retries the failed request with a new access token.
  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final dio = Dio();
    requestOptions.headers["Authorization"] =
        "Bearer $_accessToken"; // Attach updated token.
    return dio.fetch(requestOptions);
  }

  /// Simulated function to refresh the token.
  Future<String?> _refreshToken() async {
    await Future.delayed(Duration(seconds: 2));
    return "new_access_token";
  }
}
