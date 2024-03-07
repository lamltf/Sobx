import 'package:dio/dio.dart';
import 'package:sobx/base/client/rest_client.dart';
import 'package:sobx/constants/client_constant.dart';
import 'package:sobx/constants/key_constant.dart';
import 'package:sobx/constants/local_manager.dart';

class AppApiService {
  static String api = ClientConstant.apiUrl;
  static String host = ClientConstant.hostUrl;

  late RestClient client;
  final Dio dio = Dio();
  CancelToken cancelToken = CancelToken();

  AppApiService({bool isShowError = true});

  void create({bool isShowError = true}) {
    addDioHeader();
    client = RestClient(dio: dio, cancelToken: cancelToken);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    ));
  }

  void addDioHeader({Map<String, String>? headers}) async {
    dio.options.headers.clear();
    final token = LocalManager.instance.read(key: PreferencesKey.token);
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    dio.options.headers['content-type'] = 'application/json';
    dio.options.baseUrl = api;
  }
}
