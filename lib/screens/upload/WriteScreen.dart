import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/LoginController.dart';

class WriteScreen extends StatelessWidget {
  final UserController loginController = Get.find();
  var idController = TextEditingController();
  var passwordController = TextEditingController();

  WriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Change to start
          children: [
            const SizedBox(height: 40),
            const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(width: 40),
              Text(
                "글 업로드",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ]),
            const SizedBox(height: 20),
            // 탭 바
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // 1 자료 업로드
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Image.asset(
                    'assets/images/circle1.png',
                    width: 30,
                  ),
                  const Text(
                    " 자료 업로드",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ]),
                Image.asset(
                  'assets/images/Rectangle 20.png',
                  width: 300,
                ),
              ]),
              SizedBox(width: 150),

              //2 글 작성
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Image.asset(
                    'assets/images/circle2.png',
                    width: 30,
                  ),
                  const Text(
                    " 글 작성",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ]),
                Image.asset(
                  'assets/images/Rectangle 21.png',
                  width: 300,
                ),
              ]),
            ]),
            const SizedBox(height: 20),
            Container(
              width: Get.width * 0.7,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                    Text(
                      "*은 필수 입력 란입니다.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF737373)),
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  const TextField(
                      decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '글 제목*',
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  ToggleButtons(
                    onPressed: (int index) {},
                    isSelected: List.generate(4, (_) => false),
                    children: <Widget>[
                      Text(
                        "   전공   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "   교양   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "   취업자료   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "   기타   ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '학과*',
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '자료 내용*',
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '교수명*',
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '자료의 년도*',
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
