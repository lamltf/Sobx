import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:get_storage/get_storage.dart';
import 'package:sobx/base/ui/ic.dart';
import 'package:sobx/constants/key_constant.dart';
import 'package:sobx/constants/local_manager.dart';
import 'package:sobx/routes/app_routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      bool onboard =
          LocalManager.instance.read(key: PreferencesKey.onboard) ?? false;
      if (onboard) {
        if (LocalManager.instance.read(key: PreferencesKey.username) != null) {
          Get.offAllNamed(Routes.signIn, arguments: true);
        } else {
          Get.offAllNamed(Routes.login);
        }
      } else {
        Get.offAllNamed(Routes.onboarding);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Sobx',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('Any shopping just from home'),
                  ],
                )),
            Positioned(
                bottom: 40,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: const MbpImage(
                    name: 'loading',
                    width: 40,
                    height: 40,
                  ),
                )),
            const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text('Version 0.0.1'),
                )),
          ],
        ),
      ),
    );
  }
}
