import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sobx/base/ui/base_scaffold.dart';
import 'package:sobx/base/ui/ic.dart';
import 'package:sobx/base/ui/sb_button.dart';
import 'package:sobx/base/ui/sb_form.dart';
import 'package:sobx/base/ui/sb_popup.dart';
import 'package:sobx/routes/app_routes.dart';

class ForgotPassowrdScreen extends BaseScaffold {
  ForgotPassowrdScreen({super.key, this.isFromSignIn = true});

  final bool isFromSignIn;

  @override
  String get title => 'Forgot Password';

  @override
  Widget? get bottomButton => Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: SBButtonDefault(
            onTap: () {
              Get.toNamed(Routes.otp);
            },
            title: 'Continue'),
      );

  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MbpImage(
            name: 'forgot_password',
            width: 1.sw / 1.8,
          ),
          const SizedBox(height: 40),
          isFromSignIn
              ? Column(
                  children: [
                    const Text(
                      'Enter which account details we should use to reset your password.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    MBPTextField(
                      onChanged: (value) {},
                      hint: 'Email or Phone Number',
                    )
                  ],
                )
              : Column(
                  children: [
                    const Text(
                        'Select which account details should we use to reset your password.',
                        style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 20),
                    Container(
                      width: 1.sw,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.sms,
                                color: Colors.black,
                                size: 26,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('via SMS:'),
                              SizedBox(height: 8),
                              Text(
                                '+84 8******27',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 1.sw,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26, width: 1.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.mail_rounded,
                                color: Colors.black,
                                size: 26,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('via Email:'),
                              SizedBox(height: 8),
                              Text(
                                'l***t@gmail.com',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class NewPassowrdScreen extends BaseScaffold {
  NewPassowrdScreen({super.key});

  @override
  String get title => 'Create New Password';

  @override
  Widget? get bottomButton => Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: SBButtonDefault(
            onTap: () {
              showPopupInfo(
                  onTapDone: () {},
                  isShowButton: false,
                  isShowloading: true,
                  icon: const MbpImage(name: 'shield', width: 160),
                  content:
                      'Your account is ready to use. You will be redirected to Home page in a  few seconds.');
            },
            title: 'Continue'),
      );

  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MbpImage(
            name: 'forgot_password',
            width: 1.sw / 1.8,
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              const Text(
                'Create Your New Password',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              MBPPassWordTextField(
                onChanged: (value) {},
                hint: 'New Password',
              ),
              MBPPassWordTextField(
                onChanged: (value) {},
                hint: 'Confirm New Password',
              ),
              Row(
                children: [
                  Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      value: true,
                      activeColor: Colors.black,
                      onChanged: (value) {
                        // controller.isRemember.value = value!;
                      }),
                  const Text('Remember me')
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
