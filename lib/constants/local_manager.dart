import 'package:get_storage/get_storage.dart';

class LocalManager {
  static LocalManager? _instance;

  LocalManager._();

  static LocalManager get instance => _instance ??= LocalManager._();

  GetStorage box = GetStorage();

  void save({required String key, dynamic value}) async {
    await box.write(key, value);
  }

  dynamic read({required String key}) {
    return box.read(key);
  }

  void delete({required String key}) async {
    box.remove(key);
  }
}
