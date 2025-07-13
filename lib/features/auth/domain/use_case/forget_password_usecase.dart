import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/error_handling.dart';
import '../repository/auth_repository.dart';

@Injectable()
class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

 Future<Either<Failure, String>> call(String email) {
    return repository.forgetPassword(email);
  }
}

