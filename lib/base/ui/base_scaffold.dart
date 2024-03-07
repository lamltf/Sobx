import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseScaffold<T> extends GetView {
  BaseScaffold({Key? key}) : super(key: key);

  @override
  T get controller => GetInstance().find<T>(tag: tag)!;

  bool isShowAppBar = true;
  String? title;
  bool? willPopScope;
  Widget? customLeading;
  Color? colorAppbar;
  Widget? bottomButton;
  Widget? bottomNavigationBar;
  double? padding;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(willPopScope ?? true);
      },
      child: Scaffold(
        appBar: isShowAppBar == true
            ? AppBar(
                elevation: 0.0,
                backgroundColor: colorAppbar ?? Colors.transparent,
                // centerTitle: true,
                title: Text(
                  title ?? '',
                  style:
                      TextStyle(color: CupertinoTheme.of(context).primaryColor),
                ),
                titleSpacing: 0,
                leading: customLeading ??
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black87,
                        )),
              )
            : null,
        bottomNavigationBar: bottomNavigationBar,
        body: Container(
          padding: EdgeInsets.all(padding ?? 0),
          margin: EdgeInsets.only(bottom: bottomButton == null ? 0 : 88),
          child: buildContent(context),
        ),
        bottomSheet: bottomButton,
      ),
    );
  }

  Widget buildContent(BuildContext context);
}
