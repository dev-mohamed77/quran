import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://qurani-api.herokuapp.com/api/",
    receiveDataWhenStatusError: true,
    sendTimeout: 15 * 1000,
    connectTimeout: 15 * 1000,
    receiveTimeout: 15 * 1000,
  ));

  Future<Response> fetchData({
    required String url,
  }) async {
    return await dio.get(
      url,
      queryParameters: {},
    );
  }

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
