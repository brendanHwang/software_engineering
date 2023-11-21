import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/models/Content.dart';
import 'package:software_engineering/screens/Screen.dart';
import 'package:software_engineering/widgets/SearchScreen/IconReviewView.dart';
import 'package:software_engineering/widgets/PayButton.dart';

class ContentsInfoScreen extends StatelessWidget {
  const ContentsInfoScreen({super.key, required this.content});

  final Content content;

  @override
  Widget build(BuildContext context) {
    return Screen(
      isScrollable: true,
      child: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 자료 제목
                  Text(
                    '제목: ${content.title}',
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'BMDOHYEN'),
                  ),
                  // 자료 유형
                  Text(
                    '자료 유형: ${content.contentType}',
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'BMDOHYEN'),
                  ),
                  // 학과
                  Text(
                    '학과: ${content.department}',
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'BMDOHYEN'),
                  ),
                ],
              ),
              Row(
                children: [
                  IconReviewView(
                      like: content.getReviewString(AppString.like),
                      normal: content.getReviewString(AppString.normal),
                      dislike: content.getReviewString(AppString.dislike)),
                  // 자료 구매 버튼
                  const PayButton()
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
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
                  '한양대학교 컴퓨터소프트웨어학부 2023학년도 2학기 소프트웨어공학 xxx교수님 수업 내용 필기입니다.', //TODO: 자료 설명 content에 아직 이런 field가 없음
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
