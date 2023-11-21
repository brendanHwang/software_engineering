import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppColor.dart';
import 'package:software_engineering/constants/AppSize.dart';
import 'package:software_engineering/screens/AuthenticationWrapper.dart';
import 'package:software_engineering/screens/MainPage.dart';
import 'package:software_engineering/screens/MyPage.dart';
import 'package:software_engineering/utils/firebase_auth.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasAppBarLogo;
  final bool isMyPage; // TODO: 마이페이지에서는 마이페이지로 이동 대신 탈퇴

  const CustomAppBar(
      {super.key, this.hasAppBarLogo = true, this.isMyPage = false});

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
      title: hasAppBarLogo
          ? Image.asset(
              'assets/images/logo2-removebg.png',
              height: 100,
            )
          : null,
      centerTitle: true,
      toolbarHeight: AppSize.navigationTabHeight,
      leadingWidth: AppSize.homeIconsSize + 20,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        child: IconButton(
            icon: const Icon(
              Icons.home_outlined,
              color: Color(AppColor.iconColor),
              size: AppSize.homeIconsSize,
            ),
            onPressed: () => Get.to(() => MainPage())),
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
      isMyPage
          ? _buildAppBarAction(
              text: '탈퇴',
              onPressed: () {
                //TODO : 탈퇴 기능
              })
          : _buildAppBarAction(
              text: '마이페이지',
              onPressed: () {
                Get.to(() => MyPage());
              }),
      _buildAppBarAction(
          text: '로그아웃',
          onPressed: () {
            firebaseLogout();
            Get.offAll(() => const AuthenticationWrapper());
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
