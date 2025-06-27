import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_movie_app/core/common/error_handling.dart';

import '../model/Sign_in_response.dart';
import '../model/Sign_up_response.dart';
import 'auth_data_source.dart';

@Injectable(as: AuthDataSource)
class ApiDataSourceImp implements AuthDataSource {
  static final String baseUrl = 'https://route-movie-apis.vercel.app';
  static final String signInEndPoint = '/auth/login';
  static final String signUpEndPoint = '/auth/register';
  static final String resetPasswordEndPoint = '/auth/reset-password';

  Dio dio = Dio();
  @override
  Future<String> forgotPassword(String email) async {
    try {
      final response = await dio.patch(
        baseUrl + resetPasswordEndPoint,
        data: {"email": email},
      );

      if (response.data['message'] == 'fail') {
        throw Failure(errMessage: response.data['error'] ?? 'Something went wrong');
      }

      return response.data['message'];
    } catch (e) {
      throw Failure.handleError(e);
    }
  }

  @override
  Future<SignInResponse> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var response = await dio.post(
      baseUrl + signInEndPoint,
      data: {"email": email, "password": password},
    );
    if (response.data['message'] == 'fail' ) {
      throw Failure(errMessage: response.data['message']);
    }
    return SignInResponse.fromJson(response.data);
  }

  @override
 Future<SignUpResponse> signUp({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    var response = await dio.post(
      baseUrl + signUpEndPoint,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": password,
        "phone": phoneNumber,
        "avaterId": 1,
      },
    );
    if (response.data['message'] == 'fail') {
      throw Failure(errMessage: response.data['message']);
    }
    return SignUpResponse.fromJson(response.data);
  }
}
