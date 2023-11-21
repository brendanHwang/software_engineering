import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/AppSearchController.dart';
import 'package:software_engineering/screens/upload/UploadScreen.dart';

import 'Screen.dart';
import 'SearchScreen.dart';

class MainPage extends StatelessWidget {
  final appSearchController = Get.find<AppSearchController>();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Screen(
      hasAppBarLogo: false,
      floatingButton: FloatingActionButton(
        backgroundColor: Colors.black, // 배경색: 검은색
        onPressed: () {
          // 버튼을 눌렀을 때의 추가적인 동작
          Get.to(() => UploadScreen()); // WritingPage로 이동??
        },
        child: const Icon(
          Icons.add, // 돋보기 아이콘
          color: Colors.white, // 아이콘 색상
        ),
      ),
      isScrollable: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(flex: 3),
          Image.asset('assets/images/logo2.png', width: 350),
          const Spacer(flex: 1),
          GestureDetector(
            onTap: () {
              // 사용자가 이 영역을 탭하면 SearchScreen으로 이동
              Get.to(() => SearchScreen());
            },
            child: TextField(
              controller: _controller,
              onChanged: (value) {
                var userInput = value; //사용자가 입력하는 값이 담김.
              },
              decoration: InputDecoration(
                  hintText: '검색어를 입력하세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 25.0), // 사이즈 조절
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // 돋보기 아이콘을 눌렀을 때의 동작
                      //Get.to(() => SearchScreen()); // 이동
                    },
                    child: IconButton(
                      //돋보기 아이콘
                      icon: const Icon(Icons.search),
                      color: Colors.grey, // 아이콘 색상
                      onPressed: () async {
                        bool result = await appSearchController.search(_controller.text);
                        if (result) {
                          Get.to(() => SearchScreen());
                        }
                      },
                    ),
                  )),
            ),
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
