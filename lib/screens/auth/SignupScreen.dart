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
