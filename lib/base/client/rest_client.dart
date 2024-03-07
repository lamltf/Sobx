import 'package:dio/dio.dart';

class RestClient {
  Dio dio;
  CancelToken cancelToken;

  RestClient({required this.dio, required this.cancelToken});

  Future requestApi({
    Map<String, dynamic>? body,
    required String path,
    HttpMethodCustom? method = HttpMethodCustom.POST,
    required Function(DioException) onError,
  }) async {
    try {
      final result = await dio.request(
        path,
        options: Options(method: method.toString().split('.').last),
        cancelToken: cancelToken,
        data: body,
      );
      return result.data;
    } on DioException catch (e) {
      onError(e);
      return null;
    }
  }
}

// ignore: constant_identifier_names
enum HttpMethodCustom { GET, POST, DELETE, PATCH, PUT, UPDATE }
