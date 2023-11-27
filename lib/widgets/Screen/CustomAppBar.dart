import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppColor.dart';
import 'package:software_engineering/constants/AppSize.dart';
import 'package:software_engineering/controllers/PurchasedController.dart';
import 'package:software_engineering/screens/AuthenticationWrapper.dart';
import 'package:software_engineering/screens/MainPage.dart';
import 'package:software_engineering/screens/MyPage.dart';
import 'package:software_engineering/utils/firebase_auth.dart';
import 'package:software_engineering/widgets/PayButton.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasAppBarLogo;
  final bool isMyPage; // TODO: 마이페이지에서는 마이페이지로 이동 대신 탈퇴

  CustomAppBar({super.key, this.hasAppBarLogo = true, this.isMyPage = false});

  final purchaseController = Get.find<PurchasedController>();

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
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return [
      StreamBuilder<int>(
        stream: getPoints(getCurrentUserUid()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text(
              'Error: ${snapshot.error}',
            );
          } else {
            return _buildAppBarAction(
              text: '포인트: ${snapshot.data}',
              onPressed: () {
                // TODO: 포인트 기능
              },
              isTextButton: false,
            );
          }
        },
      ),
      isMyPage
          ? _buildAppBarAction(
              text: '탈퇴',
              onPressed: () {
                //TODO : 탈퇴 기능
                _showDeleteAccountDialog(context);
              })
          : _buildAppBarAction(
              text: '마이페이지',
              onPressed: () async {
                await purchaseController.getPurchasedContents();
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

Stream<int> getPoints(String userId) {
  return FirebaseFirestore.instance
      .collection('user')
      .doc(userId)
      .snapshots()
      .map((snapshot) => snapshot.data()?['point'] ?? 0);
}

void _showDeleteAccountDialog(BuildContext context) {
  String? password = '';

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('탈퇴하기'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('비밀번호를 입력하세요:'),
            TextFormField(
              obscureText: true,
              obscuringCharacter: '*',
              onChanged: (value) {
                password = value;
              },
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              if (password != null && password!.isNotEmpty) {
                // 기존 코드를 변경하지 않고 새로운 함수를 호출합니다.
                _deleteAccountWithPassword(context, password!);
                Navigator.pop(context);
              } else {
                // SnackBar(content: Text('비밀번호를 입력해주세요.')); -> 안됨
                Get.snackbar(
                  '오류',
                  '비밀번호를 입력하세요.',
                  snackPosition: SnackPosition.BOTTOM,
                  forwardAnimationCurve: Curves.easeInSine,
                  reverseAnimationCurve: Curves.easeInOut,
                  backgroundColor: Colors.blueGrey[50],
                );
              }
            },
            child: const Text('확인'),
          ),
        ],
      );
    },
  );
}

void _deleteAccountWithPassword(BuildContext context, String password) {
  deleteAccount(context, password);
}

void goToMyPage(BuildContext context) async {
  final purchasedController = Get.find<PurchasedController>();

  // 데이터를 가져오고나서 페이지로 이동
  await purchasedController.getPurchasedContents();

  if (purchasedController.purchasedContents.isNotEmpty) {
    // 구매한 컨텐츠가 있을 때 마이페이지로 이동
    Get.to(() => MyPage());
    print("구매한 컨텐츠 있음.");
  } else {
    // 구매한 컨텐츠가 없는 경우 경고창 표시
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('구매 내역이 없습니다'),
          actions: <Widget>[
            TextButton(
              child: const Text('확인'),
              onPressed: () {
                Navigator.pop(context); // 경고창 닫기
              },
            ),
          ],
        );
      },
    );
  }
}
