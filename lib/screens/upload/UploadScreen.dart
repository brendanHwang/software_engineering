import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/LoginController.dart';
import 'package:software_engineering/screens/Screen.dart';
import 'package:software_engineering/screens/upload/WriteScreen.dart';

class UploadScreen extends StatelessWidget {
  final UserController loginController = Get.find();
  var idController = TextEditingController();
  var passwordController = TextEditingController();

  UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
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
                  'assets/images/Rectangle 21.png',
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
                  'assets/images/Rectangle 20.png',
                  width: 300,
                ),
              ]),
            ]),
            const SizedBox(height: 20),
            Container(
              // alignment: Alignment(-1.0, -1.0),
              decoration: BoxDecoration(
                color: const Color(0xFFEFEFEF),
                borderRadius: BorderRadius.circular(20),
                border: const Border.fromBorderSide(
                  BorderSide(
                    color: Colors.black, // 테두리 색상
                    width: 1.0, // 테두리 두께
                    style: BorderStyle.solid, // 테두리 스타일
                  ),
                ),
              ),
              width: Get.width * 0.7,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Image.asset(
                    'assets/images/Cloud upload.png',
                    width: 100,
                  ),
                  const Text(
                    "Drag & Drop files",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() => WriteScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF2260FF),
                    ),
                    child: const Text(
                      "Browse \n My files",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "업로드 할 수 있는 자료의 형식은 doc, docx, hwp, pdf, ppt, txt, xls, xlsx, JPEG, GIF, BMP, PNG 입니다.\n"
                        "파일 크기 제한은 20MB입니다.",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF888888)),
                  ),
                ],
              ),
            ),
          ],
        ),

    );
  }
}
