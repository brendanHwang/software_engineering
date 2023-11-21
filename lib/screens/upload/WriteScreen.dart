import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/UploadController.dart';
import 'package:software_engineering/screens/Screen.dart';
import 'package:software_engineering/widgets/Upload/ContentYearSelection.dart';

class WriteScreen extends StatelessWidget {
  WriteScreen({super.key});

  final uploadController = Get.find<UploadController>();
  final List<bool> _isSelected =
      List.generate(4, (index) => false).obs; // 각 버튼의 선택 상태를 관리

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
          _buildProgressBar(),
          const SizedBox(height: 20),
          Container(
            width: Get.width * 0.7,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    "*은 필수 입력 란입니다.",
                    style: TextStyle(fontSize: 20, color: Color(0xFF737373)),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                _buildTitleTextField(),
                const SizedBox(
                  height: 20,
                ),
                _buildContentTypeToggleButton(),
                const SizedBox(
                  height: 20,
                ),
                _buildDepartmentTextField(),
                const SizedBox(
                  height: 20,
                ),
                _buildFileDescriptionTextField(),
                const SizedBox(
                  height: 20,
                ),
                _buildProfNameTextField(),
                const SizedBox(
                  height: 20,
                ),
                ContentYearSelection(),
                const SizedBox(
                  height: 80,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {
                      //TODO firebase 연동
                      uploadController.upload();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF2260FF),
                    ),
                    child: const Text(
                      "Upload",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildProgressBar() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          )
        ]),
        Image.asset(
          'assets/images/Rectangle 20.png',
          width: 300,
        ),
      ]),
      const SizedBox(width: 150),

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
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          )
        ]),
        Image.asset(
          'assets/images/Rectangle 21.png',
          width: 300,
        ),
      ]),
    ]);
  }

  _buildTitleTextField() {
    return TextField(
        onChanged: (title) {
          uploadController.content.title = title;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '글 제목*',
        ));
  }

  Widget _buildContentTypeToggleButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "자료 유형 선택",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Obx(
          () => ToggleButtons(
            borderColor: Colors.black,
            fillColor: Colors.blue,
            selectedColor: Colors.white,
            // 선택된 버튼의 내부 텍스트 색상
            onPressed: (int index) {
              uploadController.content
                  .setContentTypeToString(contentTypeIdx: index);

              // 선택 상태를 업데이트
              for (int i = 0; i < _isSelected.length; i++) {
                _isSelected[i] = i == index;
              }
            },
            isSelected: _isSelected,
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "전공",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "교양",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "취업자료",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "기타",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildDepartmentTextField() {
    return TextField(
        onChanged: (department) {
          uploadController.content.department = department;
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: '학과*'));
  }

  _buildFileDescriptionTextField() {
    return TextField(
        onChanged: (fileDescription) {
          uploadController.content.fileDescription = fileDescription;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '자료 내용*',
        ));

  }
  _buildProfNameTextField() {
    return TextField(
        onChanged: (profName) {
          uploadController.content.profName = profName;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: '교수명',
        ));

  }


}
