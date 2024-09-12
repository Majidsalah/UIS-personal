import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class Serverfailure extends Failure {
  Serverfailure(super.errorMessage);
  factory Serverfailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return Serverfailure('connection Timeout');
      case DioExceptionType.sendTimeout:
        return Serverfailure('send Timeout');
      case DioExceptionType.receiveTimeout:
        return Serverfailure('receive Timeout');
      case DioExceptionType.badCertificate:
        return Serverfailure('badCertificate');
      case DioExceptionType.badResponse:
        return Serverfailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return Serverfailure('cancel');
      case DioExceptionType.connectionError:
        return Serverfailure('connection Error , No internet connection');
      case DioExceptionType.unknown:
        return Serverfailure('Unexpected error please try again');
      default:
        return Serverfailure('Unexpected error please try again');
    }
  }

  factory Serverfailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return Serverfailure(response['error']['message']);
    } else if (statusCode == 404) {
      return Serverfailure('Your request not found, try again');
    } else if (statusCode == 500) {
      return Serverfailure('Opps There was an error,please try again');
    } else {
      return Serverfailure('Opps There was an error,please try again');
    }
  }
}
