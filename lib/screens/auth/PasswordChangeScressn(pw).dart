import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/PwChangeController.dart';
import 'package:software_engineering/screens/auth/LoginScreen.dart';

class PwchangeScreenPw extends StatelessWidget {
  final PwChangeController pwChangeController = Get.put(PwChangeController());

  PwchangeScreenPw({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
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
                      controller: passwordController,
                      onChanged: (value) =>
                          pwChangeController.user.value.password = value,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "비밀번호"),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passwordApproveController,
                      onChanged: (value) =>
                          pwChangeController.user.value.password = value,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "비밀번호 확인"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        pwChangeController.pwChange();
                      },
                      child: const Text("비밀번호 재설정"),
                    ),
                    const SizedBox(height: 50),
                    TextButton(
                      onPressed: () => Get.to(() => LoginScreen()),
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
