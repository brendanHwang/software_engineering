import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screen.dart';
import 'SearchScreen.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen(
      hasAppBarLogo: false,
      hasFloatingButton: true,
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
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                border: Border.all(color: Colors.grey),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '검색어를 입력하세요',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
          ),
          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
