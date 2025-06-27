import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/error_handling.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImp({required AuthDataSource authDataSource})
    : _authDataSource = authDataSource;
  @override
  Future<Either<Failure, String>> forgetPassword(String email) async {
    try {
      final result = await _authDataSource.forgotPassword(email);
      return right(result);
    } catch (e) {
      return left(Failure.handleError(e));
    }
  }
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var data = await _authDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserEntity(email: email);
      return right(user);
    } catch (e) {
      var failure = Failure.handleError(e);
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      var data = await _authDataSource.signUp(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );
      return right(data.data!);
    } catch (e) {
      var failure = Failure.handleError(e);
      return left(failure);
    }
  }
}
