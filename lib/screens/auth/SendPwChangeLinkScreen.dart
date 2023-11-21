import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/PwChangeController.dart';
import 'package:software_engineering/screens/auth/LoginScreen.dart';

class SendPwChangeLinkScreen extends StatelessWidget {
  final PwChangeController pwChangeController = Get.put(PwChangeController());

  SendPwChangeLinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var idController = TextEditingController();

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
                      controller: idController,
                      onChanged: (value) =>
                          pwChangeController.user.value.email = value,
                      decoration: const InputDecoration(labelText: "이메일"),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        String message = await pwChangeController
                            .resetPassword(pwChangeController.user.value.email);
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('알림'),
                              content: Text(
                                  message),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('확인'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    if(message =='비밀번호 재설정 이메일이 전송되었습니다.')
                                      Get.to(()=>LoginScreen());
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text("비밀번호 재설정 링크 전송"),
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
