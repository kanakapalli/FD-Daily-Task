import 'package:dio/dio.dart';

import 'base/base_interceptor.dart';

class ThirdPartIntegrationInterceptor extends BaseInterceptor {
  ThirdPartIntegrationInterceptor({
    required this.apiKey,
  });
  final String apiKey;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      options.queryParameters['apiKey'] = apiKey;
    } catch (e) {
      throw Exception(
          "FAILED AT ThirdPartIntegration Interceptor : problem adding apiKey ");
    }

    return super.onRequest(options, handler);
  }
}
