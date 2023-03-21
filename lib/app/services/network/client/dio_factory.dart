import 'package:dio/dio.dart';
import 'interceptor/base/base_interceptor.dart';
import 'interceptor/sendIdAsInt_interceptor.dart';
import 'interceptor/thrid_part_intergration_interceptor.dart';


class DioFactory {
  const DioFactory(
      {required this.baseUrl, this.interceptorsList = const <BaseInterceptor>[]});

  final List<BaseInterceptor> interceptorsList;

  final String baseUrl;

  Dio create() => Dio(_createBaseOptions())..interceptors.addAll(interceptorsList);

  BaseOptions _createBaseOptions() => BaseOptions(
        // Request base url
        baseUrl: baseUrl,

        // Timeout in milliseconds for receiving data
        receiveTimeout: 15000,

        // Timeout in milliseconds for sending data
        sendTimeout: 15000,

        // Timeout in milliseconds for opening url
        connectTimeout: 5000,

        // Common query parameters for each request
        queryParameters: <String, dynamic>{'parameter1': 'value1'},

        // Common headers for each request
        headers: <String, dynamic>{'header1': 'value1'},
      );
}

// example of direct use of dio
class ExampleApi {
  const ExampleApi(this._dio);

  final Dio _dio;

  Future<String> getExample() async {
    final response = await _dio.get<String>(
      '/get_example',
      queryParameters: <String, dynamic>{'parameter2': 'value2'},
      options: Options(
        headers: <String, dynamic>{'header2': 'value2'},
      ),
    );
    return response.data!;
  }
}


// excuting api calls with these both

final dio = const DioFactory(baseUrl: 'https://example.com/api').create();
final dioWithInterceptors =  DioFactory(baseUrl: 'https://example.com/api',interceptorsList: [AlwaysSendIdAsInt(),ThirdPartIntegrationInterceptor(apiKey: "api key")]).create();

// final api = ExampleApi(dio);
// final string = await api.getExample();
