import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/common/error_handling.dart';
import '../model/Sign_in_response.dart';
import '../model/Sign_up_response.dart';
import 'auth_data_source.dart';

@Injectable(as: AuthDataSource)
class ApiDataSourceImp implements AuthDataSource {
  final Dio dio;
  final SharedPreferences prefs;
  static final String _baseUrl = 'https://route-movie-apis.vercel.app';

  ApiDataSourceImp(this.dio, this.prefs);

  @override
  Future<SignInResponse> login(
      {required String email, required String password}) async {
    final resp = await dio.post(
        '$_baseUrl/auth/login', data: { 'email': email, 'password': password});
    final data = resp.data;
    if (resp.data == null) {
      throw Failure(errMessage: 'No user data returned');
    }
    if (data['message'] == 'fail') {
      throw Failure(errMessage: data['error'] ?? 'Login failed');
    }
    await prefs.setString('token', data['token']);
    return SignInResponse.fromJson(data);
  }

  @override
  Future<SignUpResponse> register(
      {required String name, required String email, required String password, required String confirmPassword, required String phone, required int avatarId}) async {
    final resp = await dio.post('$_baseUrl/auth/register', data: {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': password,
      'phone': phone,
      'avaterId': avatarId,
    });
    final data = resp.data;
    if (resp.data == null) {
      throw Failure(errMessage: 'No user data returned');
    }
    if (data['message'] == 'fail') {
      throw Failure(errMessage: data['error'] ?? 'Registration failed');
    }
    await prefs.setString('token', data['token']);
    return SignUpResponse.fromJson(data);
  }

  @override
  Future<String> resetPassword({required String email}) async {
    try {
      final resp = await dio.patch(
          '$_baseUrl/auth/reset-password', data: {'email': email});
      final data = resp.data;
      if (resp.data == null) {
        throw Failure(errMessage: 'No user data returned');
      }

      if (data['message'] == 'fail') {
        throw Failure(errMessage: data['error'] ?? 'Reset failed');
      }
      return data['message'];
    }
    catch (e) {
      throw Failure.handleError(e);
    }
  }
}
