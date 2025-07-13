import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/error_handling.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

@injectable
class SignInUseCase {
 final AuthRepository _authRepository;

  SignInUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

 Future<Either<Failure, UserEntity>> call(String email, String password) async {
  return await  _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
