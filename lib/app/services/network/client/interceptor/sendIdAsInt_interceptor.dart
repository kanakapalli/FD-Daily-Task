import 'package:dio/dio.dart';

import 'base/base_interceptor.dart';

class AlwaysSendIdAsInt extends BaseInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      options.queryParameters['id'] = int.parse(options.queryParameters['id']);
    } catch (e) {
      throw Exception(
          "FAILED AT INTERCEPTOR : problem at converting id to int");
    }

    return super.onRequest(options, handler);
  }
}
