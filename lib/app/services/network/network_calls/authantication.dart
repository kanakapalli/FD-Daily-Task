import 'package:daily_task/app/models/Auth/login_datamodel.dart';
import 'package:dio/dio.dart';

class AuthenticationApi {
  const AuthenticationApi(this._dio);

  final Dio _dio;

  Future<LoginResponse> login(
      {required String username, required String password}) async {
    final response = await _dio.post(
      '/login',
      queryParameters: {'username': username, 'password': password},
      // options: Options(
      //   headers: <String, dynamic>{'header2': 'value2'},
      // ),
    );

    return LoginResponse.fromJson(response.data);
  }
}

// final api = AuthenticationApi(dio);
// final string = await api.login(username: "",password: "");