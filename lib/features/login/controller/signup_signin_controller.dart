import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sobx/constants/key_constant.dart';
import 'package:sobx/constants/local_manager.dart';
import 'package:sobx/features/login/usecase/login_usecase.dart';
import 'package:sobx/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpSignInController extends GetxController {
  LoginUsecase loginUsecase = ILoginUsecase();

  var isSignIn = true.obs;
  var isRemember = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var errorEmail = ''.obs;
  var errorPassword = ''.obs;

  @override
  void onInit() {
    isSignIn.value = Get.arguments ?? true;
    emailController.text =
        LocalManager.instance.read(key: PreferencesKey.username) ?? '';
    super.onInit();
  }

  onChange() {
    errorEmail.value = '';
    errorPassword.value = '';
  }

  bool onValid() {
    if (emailController.text.isEmpty) {
      errorEmail.value = 'Not empty';
      return false;
    } else if (passwordController.text.isEmpty) {
      errorPassword.value = 'Not empty';
      return false;
    }
    return true;
  }

  onNextStep() async {
    if (isSignIn.value) {
      if (onValid()) {
        final body = {
          'email': emailController.text,
          'password': passwordController.text
        };

        final data = await loginUsecase.login(body: body);
        if (data['code'] == 0) {
          Get.offAllNamed(Routes.home);
        }
      }
    } else {
      Get.toNamed(Routes.profileFill);
    }
  }
}
