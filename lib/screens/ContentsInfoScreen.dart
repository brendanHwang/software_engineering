import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:dotted_border/dotted_border.dart';

class ContentsInfoScreen extends StatelessWidget {
  const ContentsInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 100, 50, 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 자료 제목
                      Text(
                        '제목: 한양대 소프트웨어공학 필기',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'BMDOHYEN'),
                      ),
                      // 자료 유형
                      Text(
                        '자료 유형: 전공',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'BMDOHYEN'),
                      ),
                      // 학과
                      Text(
                        '학과: 컴퓨터소프트웨어학과',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'BMDOHYEN'),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    // 리뷰 표시
                    Container(
                      height: 60.0,
                      width: 425,
                      decoration: BoxDecoration(
                        color: const Color(0xFFd9d9d9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.sentiment_very_satisfied,
                              size: 45.0, color: Colors.black),
                          Text(
                            "20",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'BMDOHYEN'),
                          ),
                          Icon(Icons.sentiment_neutral,
                              size: 45.0, color: Colors.black),
                          Text(
                            "13",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'BMDOHYEN'),
                          ),
                          Icon(Icons.sentiment_very_dissatisfied,
                              size: 45.0, color: Colors.black),
                          Text(
                            "34",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'BMDOHYEN'),
                          ),
                        ],
                      ),
                    ),
                    // 자료 구매 버튼
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        size: 50,
                        color: Color(0xFF808080),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // 자료 설명
          // 점선 border 컨테이너
          DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: const [5, 5],
            strokeWidth: 2.5,
            radius: const Radius.circular(30),
            child: Container(
              height: 220,
              width: 1200,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: const Color(0xFFd9d9d9),
                  borderRadius: BorderRadius.circular(30)),
              child: const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  '한양대학교 컴퓨터소프트웨어학부 2023학년도 2학기 소프트웨어공학 xxx교수님 수업 내용 필기입니다.',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'BMDOHYEN'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
