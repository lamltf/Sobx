import 'package:sobx/base/client/base_client.dart';
import 'package:sobx/constants/key_constant.dart';
import 'package:sobx/constants/local_manager.dart';

abstract class LoginUsecase {
  Future login({dynamic body});
}

class ILoginUsecase extends BaseClient implements LoginUsecase {
  @override
  Future login({body}) async {
    final data = await apiService.client.requestApi(
      body: body,
      path: 'login',
      onError: (error) {},
    );

    if (data['code'] == 0 && data['token'] != null) {
      LocalManager.instance
          .save(key: PreferencesKey.token, value: data['token']);
      LocalManager.instance
          .save(key: PreferencesKey.username, value: data['email']);
    }

    return data;
  }
}
