import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/LoginController.dart';
import 'package:software_engineering/screens/SignupPage.dat.dart';



class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

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
                    ElevatedButton(
                      onPressed: controller.login,
                      child: const Text("로그인"),
                    ),
                    const SizedBox(height: 50),
                    TextButton(
                      onPressed: () => {},
                      child: const Text("비밀번호를 잊으셨나요?"),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () => {
                        Get.to(() => SignupPage() )
                      },
                      child: const Text("아직 회원가입을 안하셨나요?"),
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
