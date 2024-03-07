import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sobx/base/ui/base_scaffold.dart';
import 'package:sobx/base/ui/sb_button.dart';
import 'package:sobx/routes/app_routes.dart';

class OTPScreen extends BaseScaffold {
  OTPScreen({super.key});

  @override
  String get title => 'Verify OTP';

  @override
  Widget? get bottomButton => Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: SBButtonDefault(
            onTap: () {
              Get.toNamed(Routes.createNewPassword);
            },
            title: 'Verify'),
      );

  @override
  Widget buildContent(BuildContext context) {
    const focusedBorderColor = Colors.black;

    final defaultPinTheme = PinTheme(
      width: 72,
      height: 48,
      textStyle: const TextStyle(
          fontSize: 24,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Code has been send to +84 85*****27',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              obscureText: true,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text('Resend code in 53s', style: TextStyle(fontSize: 16))
          ],
        ),
      ),
    );
  }
}
