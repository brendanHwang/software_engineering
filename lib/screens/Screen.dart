import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppPadding.dart';
import 'package:software_engineering/constants/AppSize.dart';
import 'package:software_engineering/widgets/Screen/CustomAppBar.dart';

class Screen extends StatefulWidget {
  final Widget child;
  final bool isScrollable;
  final Widget? floatingButton;
  final bool hasAppBarLogo;
  final bool isMyPage; // TODO: 마이페이지에서는 마이페이지로 이동 대신 탈퇴

  const Screen(
      {Key? key,
      required this.child,
      this.isScrollable = true,
      this.floatingButton,
      this.hasAppBarLogo = true,
      this.isMyPage = false})
      : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSize.navigationTabHeight),
        child: CustomAppBar(
          hasAppBarLogo: widget.hasAppBarLogo,
          isMyPage: widget.isMyPage,
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height - AppSize.navigationTabHeight,
        padding: const EdgeInsets.only(
            top: AppPadding.topPadding,
            left: AppPadding.horizontalPadding,
            right: AppPadding.horizontalPadding),
        child: widget.isScrollable
            ? SingleChildScrollView(
                child: widget.child,
              )
            : SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: widget.child),
      ),
      floatingActionButton: widget.floatingButton,
    );
  }
}
