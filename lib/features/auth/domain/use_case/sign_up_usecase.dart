import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/error_handling.dart';
import '../entity/user_entity.dart';
import '../repository/auth_repository.dart';

@injectable
class SignUpUseCase {
 final AuthRepository _authRepository ;

  SignUpUseCase({required AuthRepository authRepository}) : _authRepository = authRepository;

  Future<Either<Failure,UserEntity>> call({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async{
   return await _authRepository.signUp(
      name: name,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
  }
}
