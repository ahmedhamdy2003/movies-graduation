import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/error_handling.dart';
import '../repository/auth_repository.dart';

@injectable
class ForgetPasswordUseCase {
 final AuthRepository _authRepository;

 ForgetPasswordUseCase({required AuthRepository authRepository})
     : _authRepository = authRepository;

 Future<Either<Failure, String>> call(String email) {
  return _authRepository.forgetPassword(email);
 }
}
