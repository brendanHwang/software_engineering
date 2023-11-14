import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppPadding.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('메인페이지'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0), //이미지를 삽입하고, 아래에 50만큼의 패딩을 줌.
                child: Image.asset('assets/images/logo2.png', width: 350, ) //로고 사이즈 변경하는 부분
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          var userInput = value; //사용자가 입력하는 값이 담김.
                        },
                        decoration: InputDecoration(
                          hintText: '검색어를 입력하세요',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0), // 사이즈 조절
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // 돋보기 아이콘을 눌렀을 때의 동작
                              //Get.to(() => SearchScreen()); // 이동
                            },
                            child: IconButton( //돋보기 아이콘
                                icon: Icon(Icons.search),
                                color: Colors.grey, // 아이콘 색상
                                onPressed: () {},
                          ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //글 작성 페이지로 넘어가는 버튼
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black, // 배경색: 검은색
          onPressed: () {
            // 버튼을 눌렀을 때의 추가적인 동작
            //Get.to(() => WritingPage()); // WritingPage로 이동??
          },
          child: Icon(
            Icons.add, // 돋보기 아이콘
            color: Colors.white, // 아이콘 색상
          ),
        ),
      )
    );
  }
}
