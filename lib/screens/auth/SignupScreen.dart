import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/SignupController.dart';
import 'package:software_engineering/screens/auth/LoginScreen.dart';


class SignupScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());


  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var idController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var passwordApproveController = TextEditingController();

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
                      controller: nameController,
                      onChanged: (value) => signupController.user.value.name = value,
                      decoration: const InputDecoration(labelText: "이름"),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: idController,
                      onChanged: (value) => signupController.user.value.email = value,
                      decoration: const InputDecoration(labelText: "이메일"),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      onChanged: (value) => signupController.user.value.password = value,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "비밀번호"),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordApproveController,
                      onChanged: (value) => signupController.user.value.password = value,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "비밀번호 확인"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        signupController.signup();
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
                        Get.to(() => LoginScreen()); // 로그인 페이지로 이동
                      },
                      child: const Text("회원가입"),
                    ),
                    const SizedBox(height: 50),
                    TextButton(
                      onPressed: () =>  Get.to(() => LoginScreen()),
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
