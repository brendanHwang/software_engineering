import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppColor.dart';
import 'package:software_engineering/constants/AppPadding.dart';
import 'package:software_engineering/constants/AppSize.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: const TextStyle(
        color: Color(AppColor.mainColor),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: const Color(0xFFB1E5FB),
      elevation: 0,
      title: Image.asset(
        'assets/images/logo2-removebg.png',
        height: AppSize.navigationTabHeight * 0.8,
      ),
      centerTitle: true,
      toolbarHeight: AppSize.navigationTabHeight,
      leading: Padding(
        padding: AppPadding.homIconPadding,
        child: IconButton(
          icon: const Icon(
            Icons.home_outlined,
            color: Color(AppColor.iconColor),
            size: AppSize.homeIconsSize,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      actions: _buildActions(),
    );
  }

  List<Widget> _buildActions() {
    return [
      _buildAppBarAction(
          text: '포인트: 3',
          onPressed: () {
            // TODO: 포인트 기능
          },
          isTextButton: false),
      _buildAppBarAction(
          text: '마이페이지',
          onPressed: () {
            // TODO: 마이페이지로 이동
          }),
      _buildAppBarAction(
          text: '로그아웃',
          onPressed: () {
            // TODO: 로그아웃
          }),
    ];
  }

  Widget _buildAppBarAction(
      {required String text,
        required VoidCallback onPressed,
        isTextButton = true}) {
    if (!isTextButton) {
      return Text(
        text,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSize.navigationTabHeight);
}
