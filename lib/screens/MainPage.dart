import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppPadding.dart';
import 'package:software_engineering/screens/SearchScreen.dart';

import 'Screen.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen(
      isScrollable: false,
      child: Center(
        child: TextField(
          controller: null,
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
                onPressed: () {
                  Get.to(() => SearchScreen()); // 이동
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
