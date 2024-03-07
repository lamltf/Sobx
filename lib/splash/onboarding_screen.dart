import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sobx/base/ui/ic.dart';
import 'package:sobx/base/ui/sb_button.dart';
import 'package:sobx/constants/key_constant.dart';
import 'package:sobx/constants/local_manager.dart';
import 'package:sobx/routes/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: listOnboard.length,
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _pageIndex = value;
                });
              },
              itemBuilder: (context, index) => OndoardingContent(
                image: listOnboard[index].image,
                title: listOnboard[index].title,
                description: listOnboard[index].description,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: listOnboard.map<DotIndicator>((e) {
              int index = listOnboard.indexOf(e);
              return DotIndicator(isActive: index == _pageIndex);
            }).toList(),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            child: SBButtonDefault(
              onTap: () {
                if (_pageIndex == 2) {
                  LocalManager.instance
                      .save(key: PreferencesKey.onboard, value: true);
                  Get.offAllNamed(Routes.login);
                } else {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                }
              },
              title: (_pageIndex == 2) ? 'Bắt đầu' : 'Tiếp theo',
            ),
          ),
        ],
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> listOnboard = [
  Onboard(
      image: 'onboarding1',
      title: 'Various Collections Of The Lastest Products',
      description: 'Various Collections Of The Lastest Products'),
  Onboard(
      image: 'onboarding2',
      title: 'Complete Collection Of Colors And Sizes',
      description: 'Complete Collection Of Colors And Sizes'),
  Onboard(
      image: 'onboarding3',
      title: 'Find The Most Suitable Outfit For You',
      description: 'Find The Most Suitable Outfit For You'),
];

class OndoardingContent extends StatelessWidget {
  const OndoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MbpImage(
            name: image,
            width: 1.sw,
            height: 1.sh / 1.7,
            fit: BoxFit.cover,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              description,
              style: const TextStyle(color: Colors.black38),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        height: 4,
        width: isActive ? 12 : 4,
        decoration: BoxDecoration(
          color: isActive ? Colors.black87 : Colors.grey,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
