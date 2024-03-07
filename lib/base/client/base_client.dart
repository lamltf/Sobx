import 'package:sobx/base/client/app_api_service.dart';

abstract class BaseClient {
  AppApiService apiService = AppApiService();
  bool isShowError = true;
  BaseClient() {
    onCreate();
  }

  onCreate() async {
    apiService.create(isShowError: isShowError);
  }
}
