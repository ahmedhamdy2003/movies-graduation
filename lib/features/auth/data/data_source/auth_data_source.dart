
import '../model/Sign_in_response.dart';
import '../model/Sign_up_response.dart';

abstract class AuthDataSource {
  Future<SignInResponse> login(
      { required String email, required String password });

  Future<SignUpResponse> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  });

  Future<String> resetPassword({ required String email });
}

