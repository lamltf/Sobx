import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sobx/base/ui/base_scaffold.dart';
import 'package:sobx/base/ui/ic.dart';
import 'package:sobx/base/ui/sb_button.dart';
import 'package:sobx/base/ui/sb_form.dart';
import 'package:sobx/features/login/controller/signup_signin_controller.dart';
import 'package:sobx/routes/app_routes.dart';

// ignore: must_be_immutable
class SignUpSignInScreen extends BaseScaffold {
  SignUpSignInScreen({super.key});

  @override
  SignUpSignInController controller = Get.put(SignUpSignInController());

  @override
  Widget? get customLeading => IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black87,
        ),
      );

  @override
  Widget buildContent(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.isSignIn.value
                    ? 'Login to your\nAccount'
                    : 'Create your\nAccount',
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              Obx(
                () => MBPTextField(
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(
                    Icons.mail_rounded,
                    color: Colors.black54,
                    size: 20,
                  ),
                  hint: 'Email',
                  borderColor: Colors.transparent,
                  onChanged: (value) {
                    controller.onChange();
                  },
                  debounceTime: 0,
                  errorText: controller.errorEmail.value,
                  controller: controller.emailController,
                ),
              ),
              Obx(
                () => MBPPassWordTextField(
                  onChanged: (value) {
                    controller.onChange();
                  },
                  hint: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  errorText: controller.errorPassword.value,
                  controller: controller.passwordController,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      value: controller.isRemember.value,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        controller.isRemember.value = value!;
                      }),
                  const Text('Remember me')
                ],
              ),
              const SizedBox(height: 18),
              SBButtonDefault(
                  onTap: () {
                    controller.onNextStep();
                  },
                  title: controller.isSignIn.value ? 'Sign in' : 'Sign up'),
              const SizedBox(height: 18),
              controller.isSignIn.value
                  ? SizedBox(
                      width: 1.sw,
                      height: 40,
                      child: TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          Get.toNamed(Routes.forgotPassword);
                        },
                        child: const Text('Forgot the password?',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black87)),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 18),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('or continue with'),
                  ),
                  Expanded(child: Divider())
                ],
              ),
              const SizedBox(height: 18),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook_rounded,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Card(
                      child: IconButton(
                        onPressed: () {},
                        icon: const MbpImage(name: 'ic_google', width: 22),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Card(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.apple_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: 1.sw,
                height: 40,
                child: TextButton(
                  style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  onPressed: () {
                    controller.isSignIn.value = !controller.isSignIn.value;
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.black38)),
                    TextSpan(
                        text:
                            controller.isSignIn.value ? ' Sign up' : ' Sign in',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
