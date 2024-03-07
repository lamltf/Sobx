import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sobx/base/ui/base_scaffold.dart';
import 'package:sobx/base/ui/ic.dart';
import 'package:sobx/base/ui/sb_button.dart';
import 'package:sobx/routes/app_routes.dart';

// ignore: must_be_immutable
class LoginScreen extends BaseScaffold {
  LoginScreen({super.key});

  @override
  bool get isShowAppBar => false;

  @override
  Widget buildContent(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MbpImage(name: 'im_login', width: 240),
                const Text(
                  'Let\'s you in',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                            color: Colors.grey[300]!), // Border color
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 22,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Continue with Facebook',
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                            color: Colors.grey[300]!), // Border color
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        MbpImage(
                          name: 'ic_google',
                          width: 22,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Continue with Google',
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                            color: Colors.grey[300]!), // Border color
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.apple,
                          color: Colors.black,
                          size: 22,
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Continue with Apple',
                          style: TextStyle(color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('or'),
                    ),
                    Expanded(child: Divider())
                  ],
                ),
                const SizedBox(height: 18),
                SBButtonDefault(
                  onTap: () {
                    Get.toNamed(Routes.signIn, arguments: true);
                  },
                  title: 'Sign in with password',
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
                      Get.toNamed(Routes.signUp, arguments: false);
                    },
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black38)),
                      TextSpan(
                          text: ' Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                    ])),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
