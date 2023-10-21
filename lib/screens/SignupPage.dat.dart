import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/SignupController.dart';
import 'package:software_engineering/screens/LoginPage.dart';


class SignupPage extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo2.png',
                width: Get.width * 0.2,
              ),
              const SizedBox(height: 20),
              Container(
                width: Get.width * 0.3,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) => controller.name.value = value,
                      decoration: const InputDecoration(labelText: "이름"),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) => controller.userID.value = value,
                      decoration: const InputDecoration(labelText: "아이디"),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) => controller.password.value = value,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "비밀번호"),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      onChanged: (value) => controller.passwordApprove.value = value,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "비밀번호 확인"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: 회원가입 로직을 여기에 구현하세요
                        Get.snackbar("회원가입 성공", "로그인 페이지로 돌아갑니다.",
                        duration: const Duration(seconds: 4),
                        //  상단에 공간 확보
                        snackPosition: SnackPosition.TOP,
                        // 상단 margin
                        margin: const EdgeInsets.all(8.0),
                        //  스낵바의 배경색
                        backgroundColor: Colors.deepPurple.withOpacity(0.1),

                        ); // 간단한 알림
                        Get.to(() => LoginPage()); // 로그인 페이지로 이동
                      },
                      child: const Text("회원가입"),
                    ),
                    const SizedBox(height: 50),
                    TextButton(
                      onPressed: () =>  Get.to(() => LoginPage()),
                      child: const Text("로그인 페이지로 돌아가기"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
