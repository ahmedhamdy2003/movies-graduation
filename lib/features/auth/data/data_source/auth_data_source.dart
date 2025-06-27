
import '../model/Sign_in_response.dart';
import '../model/Sign_up_response.dart';

abstract class AuthDataSource {
 Future<SignInResponse> signInWithEmailAndPassword({required String email, required String password});
 Future<SignUpResponse> signUp({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  });


 Future<String> forgotPassword(String email) ;
}
