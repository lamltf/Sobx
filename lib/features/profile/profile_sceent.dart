import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sobx/base/ui/base_scaffold.dart';
import 'package:sobx/base/ui/ic.dart';
import 'package:sobx/base/ui/sb_button.dart';
import 'package:sobx/base/ui/sb_form.dart';
import 'package:sobx/base/ui/sb_popup.dart';
import 'package:sobx/features/profile/profile_controller.dart';
import 'package:intl/intl.dart';
import 'package:sobx/routes/app_routes.dart';

// ignore: must_be_immutable
class ProfileScreenFill extends BaseScaffold {
  ProfileScreenFill({super.key});

  @override
  ProfileController controller = Get.put(ProfileController());

  @override
  String get title => 'Fill Your Profile';

  @override
  Widget? get bottomButton => Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: SBButtonDefault(
            onTap: () {
              Get.toNamed(Routes.profilePin);
            },
            title: 'Continue'),
      );

  @override
  Widget buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Obx(
                    () => CircleAvatar(
                      radius: 56,
                      backgroundColor: Colors.transparent,
                      backgroundImage: controller.pathPicked.value.path != ''
                          ? Image.file(controller.pathPicked.value).image
                          : const AssetImage('assets/images/ic_avt.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.edit_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () {
                          controller.onLibrary();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            MBPTextField(
              keyboardType: TextInputType.visiblePassword,
              hint: 'Full Name',
              borderColor: Colors.transparent,
              onChanged: (value) {},
            ),
            MBPTextField(
              keyboardType: TextInputType.visiblePassword,
              hint: 'Nickname',
              borderColor: Colors.transparent,
              onChanged: (value) {},
            ),
            MBPTextField(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: controller.dateSelected,
                  firstDate: DateTime(1900, 8),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
                  controller.dateSelected = picked;
                  controller.birthController.text = dateFormat.format(picked);
                }
              },
              controller: controller.birthController,
              isDisable: true,
              keyboardType: TextInputType.visiblePassword,
              hint: 'Date of Birth',
              suffixIcon: const Icon(
                Icons.date_range_rounded,
                color: Colors.black54,
                size: 20,
              ),
              borderColor: Colors.transparent,
              onChanged: (value) {},
            ),
            MBPTextField(
              keyboardType: TextInputType.emailAddress,
              hint: 'Email',
              suffixIcon: const Icon(
                Icons.mail_rounded,
                color: Colors.black54,
                size: 20,
              ),
              borderColor: Colors.transparent,
              onChanged: (value) {},
            ),
            MBPTextField(
              keyboardType: TextInputType.phone,
              hint: 'Phone Number',
              borderColor: Colors.transparent,
              prefixIcon: const CountryCodePicker(
                initialSelection: 'VN',
              ),
              onChanged: (value) {},
            ),
            MBPDropDownButton(
              hint: 'Gender',
              controller: controller.genderController,
              onTap: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16))),
                    context: context,
                    builder: (builder) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Select your gender',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Column(
                              children: controller.listGender.map((e) {
                                return InkWell(
                                  onTap: () {
                                    Get.back();
                                    controller.selectGender(e);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    margin: const EdgeInsets.only(bottom: 16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: controller
                                                      .genderController.text ==
                                                  e
                                              ? Colors.blueAccent
                                              : Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    width: 1.sw,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                                color: controller
                                                            .genderController
                                                            .text ==
                                                        e
                                                    ? Colors.blueAccent
                                                    : Colors.grey),
                                          ),
                                        ),
                                        if (controller.genderController.text ==
                                            e)
                                          const Icon(Icons.check,
                                              color: Colors.blueAccent, size: 1)
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreenPin extends BaseScaffold {
  ProfileScreenPin({super.key});

  @override
  String get title => 'Create New PIN';

  @override
  Widget? get bottomButton => Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(16),
        child: SBButtonDefault(
            onTap: () {
              Get.toNamed(Routes.profileFingerprint);
            },
            title: 'Continue'),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Add a PIN number to make your account more secure.',
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
            )
          ],
        ),
      ),
    );
  }
}

class ProfileScreenFignerprint extends BaseScaffold {
  ProfileScreenFignerprint({super.key});

  @override
  String get title => 'Set Your Fingerprint';

  @override
  Widget? get bottomButton => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16),
              child: SBButtonDefault(
                  color: Colors.grey[300],
                  textColor: Colors.black,
                  onTap: () {
                    showPopupInfo(
                        onTapDone: () {},
                        isShowButton: false,
                        icon: const MbpImage(name: 'account', width: 160),
                        isShowloading: true,
                        content:
                            'Your account is ready to use. You will be redirected to Home page in a  few seconds.');
                  },
                  title: 'Skip'),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(16),
              child: SBButtonDefault(
                  onTap: () {
                    showPopupInfo(
                        onTapDone: () {},
                        isShowButton: false,
                        isShowloading: true,
                        icon: const MbpImage(name: 'account', width: 160),
                        content:
                            'Your account is ready to use. You will be redirected to Home page in a  few seconds.');
                  },
                  title: 'Continue'),
            ),
          ),
        ],
      );

  @override
  Widget buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Add a fingerprint to make your account more secure.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Expanded(
              child:
                  Center(child: MbpImage(name: 'ic_fingerprint', width: 200))),
          Text(
            'Please put your finger to the fingerpirnt scanner to get  started.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
