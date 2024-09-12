import 'package:dio/dio.dart';
import 'package:uis_attendance/core/api/api_service.dart';
import 'package:uis_attendance/core/error/failure.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio});
  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        return Serverfailure.fromDioError(e);
      }
      return Serverfailure(e.toString());
    }
  }

  @override
  Future post(String path,
      {Object? data,
      Options? options,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options
      );
      return response.data;
    } catch (e) {
      if (e is DioException) {
        return Serverfailure.fromDioError(e);
      }
      return Serverfailure(e.toString());
    }
  }
}
