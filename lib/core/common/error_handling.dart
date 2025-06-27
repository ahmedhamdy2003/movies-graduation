import 'package:dio/dio.dart';

class Failure implements Exception {
  final String errMessage;
  Failure({this.errMessage = "default error message"});

  String toString() {
    return errMessage;
  }

  static Failure handleError(error) {
    if (error is Failure) {
      return error;
    } else {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.sendTimeout:
            return TimeOutException(errMessage: "Time Out Exception");
          case DioExceptionType.badCertificate:
          case DioExceptionType.connectionError:
          case DioExceptionType.unknown:
          case DioExceptionType.badResponse:
          case DioExceptionType.cancel:
            return ServerException();
            return TimeOutException(errMessage: "Time Out Exception");
        }
      }
    }
    return Failure(errMessage: "something went wrong , type of error $error");
  }
}

class TimeOutException extends Failure {
  TimeOutException({super.errMessage});
}

class AuthException extends Failure {
  AuthException({super.errMessage = "Invalid Email or Password"});
}

class ServerException extends Failure {
  ServerException({super.errMessage = "Server Exception"});
}
