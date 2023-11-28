import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/screens/MainPage.dart';
import 'package:software_engineering/screens/auth/LoginScreen.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return LoginScreen();  // 사용자가 로그인하지 않은 경우 로그인 화면 표시
          } else {
            // 사용자가 로그인한 경우
            // 대화 상자를 표시하고, 사용자가 이를 닫으면 MainPage로 이동
            // Future.delayed(Duration.zero, () async {
            //   await Get.dialog(
            //     AlertDialog(
            //       content: Text('다들 조금만 더 힘내자 화이팅!', style: TextStyle(
            //         fontSize: 150,
            //       ),),
            //       actions: <Widget>[
            //         TextButton(
            //           child: const Text('화이팅!'),
            //           onPressed: () {
            //             Get.back(); // 대화 상자 닫기
            //           },
            //         ),
            //       ],
            //     ),
            //     barrierDismissible: false, // 배경 클릭으로 대화 상자를 닫을 수 없게 설정
            //   );
            //   Get.off(MainPage()); // MainPage로 이동
            // });
            // return Container(); // 빈 컨테이너를 반환하며 실제 페이지 이동은 대화 상자 후에 발생

            return MainPage();
          }
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),  // 연결 상태가 활성화될 때까지 로딩 표시
          ),
        );
      },
    );
  }
}
