import 'package:clean_arch_bookly_app/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('${ApiConstants.apiBaseUrl}$endPoint');
    return response.data;
  }
}
