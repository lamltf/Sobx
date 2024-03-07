import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sobx/base/ui/ic.dart';
import 'package:sobx/base/ui/sb_button.dart';
import 'dart:math' as math;

import 'package:sobx/routes/app_routes.dart';

class MBPPopUpDefault extends StatefulWidget {
  final String? doneTitle;
  final String? cancelTitle;
  final String? title;
  final String? content;
  final Widget? customContent;
  final Widget? icon;
  final Function onTapDone;
  final Function onTapCancel;
  final bool? isShowButton;
  final bool? isNotDismissPopUp;
  final bool? isShowLoading;

  const MBPPopUpDefault(
      {Key? key,
      this.doneTitle,
      this.cancelTitle,
      this.content,
      this.title,
      required this.onTapDone,
      this.customContent,
      this.icon,
      required this.onTapCancel,
      this.isShowButton = true,
      this.isNotDismissPopUp = false,
      this.isShowLoading})
      : super(key: key);

  @override
  State<MBPPopUpDefault> createState() => _MBPPopUpDefaultState();
}

class _MBPPopUpDefaultState extends State<MBPPopUpDefault>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: widget.icon == null
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.icon ?? const SizedBox(),
              const SizedBox(height: 16),
              Text(
                widget.title ?? '',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 16),
              widget.customContent ??
                  Text(widget.content ?? '',
                      textAlign: widget.icon == null
                          ? TextAlign.start
                          : TextAlign.center,
                      style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 16),
              (widget.isShowButton == true
                  ? Row(
                      children: [
                        if (widget.cancelTitle != null)
                          Expanded(
                            child: SBButtonDefault(
                              onTap: () {
                                Navigator.pop(context);
                                widget.onTapCancel();
                              },
                              title: widget.cancelTitle ?? 'Ok',
                            ),
                          ),
                        if (widget.cancelTitle != null)
                          const SizedBox(width: 8),
                        Expanded(
                          child: SBButtonDefault(
                            color: Colors.black,
                            onTap: () {
                              if (widget.isNotDismissPopUp == false) {
                                Navigator.pop(context);
                              }
                              widget.onTapDone();
                            },
                            title: widget.doneTitle ?? 'Ok',
                          ),
                        ),
                      ],
                    )
                  : const SizedBox()),
              if (widget.isShowLoading == true)
                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: child,
                    );
                  },
                  child: const MbpImage(
                    name: 'loading',
                    width: 60,
                    height: 60,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}

void showPopupInfo({
  String? cancelTitle,
  String? doneTitle,
  required Function onTapDone,
  Function? onTapCancel,
  bool barrierDismissible = true,
  bool willpopAction = false,
  String? title,
  String? content,
  Widget? customContent,
  Widget? icon,
  Function? onTapMobiMoney,
  Function? onTapWalletMoney,
  bool? isCustomWidget = false,
  bool? isShowMBPopupError = false,
  Function(String)? thenMbpPopup,
  bool? isNotDismissPopUp = false,
  bool? isShowButton = true,
  bool? isShowloading = true,
}) {
  //test thui
  Timer(const Duration(seconds: 2), () {
    Get.offAllNamed(Routes.home);
  });
  Get.dialog(
          WillPopScope(
            onWillPop: () {
              if (isShowMBPopupError!) {
                onTapDone();
                return Future.value(true);
              } else {
                if (barrierDismissible) {
                  if (willpopAction) {
                    onTapDone();
                  }
                  return Future.value(true);
                }
                return Future.value(false);
              }
            },
            child: ResponsiveWrapper.builder(
              ScrollConfiguration(
                behavior: BouncingScrollBehavior(),
                child: Dialog(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(48),
                    child: MBPPopUpDefault(
                      cancelTitle: cancelTitle,
                      doneTitle: doneTitle ?? 'Ok'.tr,
                      title: title ?? 'Congratulations!'.tr,
                      content: content,
                      customContent: customContent,
                      onTapDone: () {
                        onTapDone();
                      },
                      onTapCancel: () {
                        if (onTapCancel != null) {
                          onTapCancel();
                        }
                      },
                      icon: icon,
                      isNotDismissPopUp: isNotDismissPopUp,
                      isShowButton: isShowButton,
                      isShowLoading: isShowloading,
                    )),
              ),
              maxWidth: MediaQuery.of(Get.context!).size.width,
              defaultScale: false,
            ),
          ),
          barrierDismissible: barrierDismissible,
          transitionDuration: const Duration(milliseconds: 300))
      .then((value) {
    if (thenMbpPopup != null) {
      thenMbpPopup("");
    }
  });
}
