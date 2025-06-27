import 'package:dartz/dartz.dart';
import 'package:my_movie_app/core/common/error_handling.dart';

import '../entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure,UserEntity>> signInWithEmailAndPassword({required String email, required String password});
  Future<Either<Failure,UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  });
 Future<Either<Failure,String>> forgetPassword(String email);
}
