import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/LoginController.dart';
import 'package:software_engineering/controllers/UploadController.dart';
import 'package:software_engineering/screens/Screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html';
import 'dart:typed_data';

import 'package:software_engineering/screens/upload/WriteScreen.dart';

class UploadScreen extends StatelessWidget {
  final UserController loginController = Get.find();
  var idController = TextEditingController();
  var passwordController = TextEditingController();
  late DropzoneViewController controller;
  final uploadController =
      Get.find<UploadController>(); // UploadController 인스턴스를 찾음

  UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      isScrollable: false,
      floatingButton: Obx(() => FloatingActionButton(
            backgroundColor: uploadController.selectedFile.value == null
                ? Colors.grey
                : Colors.black, // 배경색: 검은색
            onPressed: uploadController.selectedFile.value == null
                ? () {
                    Get.snackbar(
                      "파일이 선택되지 않았습니다",
                      "파일을 업로드 하기 위해서는 파일을 선택해야 합니다",
                    );
                  }
                : () {
                    Get.to(() => WriteScreen());
                  },
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white, // 아이콘 색상ㄱ
            ),
          )),
      child: Column(
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
          _buildDropDownArea(),
        ],
      ),
    );
  }

  _buildDropDownArea() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 420.0), // 적절한 높이로 조정하세요
      child: Container(
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
        child: Stack(
          children: [
            Positioned.fill(
              child: DropzoneView(
                onCreated: (controller) => this.controller = controller,
                onLoaded: () => print('Zone loaded'),
                onError: (error) => print('Error: $error'),
                // onHover: () => print('File is hovering over zone'),
                onLeave: () => print('File has left the zone'),
                onDrop: (htmlFile) async {
                  FileReader reader = FileReader();
                  reader.readAsArrayBuffer(htmlFile);
                  reader.onLoadEnd.listen((e) {
                    Uint8List data = reader.result as Uint8List;
                    // 여기서 PlatformFile 객체를 생성합니다.
                    PlatformFile platformFile = PlatformFile(
                      name: htmlFile.name,
                      size: htmlFile.size,
                      bytes: data,
                    );

                    // 파일을 UploadController에 추가합니다.
                    uploadController.addFile(platformFile);
                  });
                },
              ),
            ),
            Positioned.fill(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  _buildFileMetaData(),
                  const SizedBox(height: 20),
                  _buildBrowseFileButton(),
                  const SizedBox(height: 20),
                  const Text(
                    "업로드 할 수 있는 자료의 형식은 doc, docx, hwp, pdf, ppt, txt, xls, xlsx, JPEG, GIF, BMP, PNG 입니다.\n"
                    "파일 크기 제한은 20MB입니다.",
                    style: TextStyle(fontSize: 15, color: Color(0xFF888888)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileMetaData() {
    final uploadController = Get.find<UploadController>();
    return Obx(() {
      if (uploadController.selectedFile.value != null) {
        // 선택된 파일이 있으면 파일의 메타데이터를 표시
        return Column(
          children: [
            const Icon(
              Icons.file_present,
              size: 100,
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            Text(
              uploadController.selectedFile.value!.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '${(uploadController.selectedFile.value!.size / 1024).toStringAsFixed(2)} KB',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
          ],
        );
      } else {
        // 선택된 파일이 없으면 기본 UI 표시
        return Column(
          children: [
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
          ],
        );
      }
    });
  }

  _buildBrowseFileButton() {
    return ElevatedButton(
      onPressed: () async {
        if (kIsWeb) {
// 파일 선택
          FilePickerResult? result =
              await FilePicker.platform.pickFiles(allowMultiple: false);

          if (result != null) {
// 선택된 파일 리스트
            PlatformFile file = result.files.first;
            uploadController.addFile(file); // 파일을 UploadController에 추가

// 여기에 파일을 서버에 업로드하는 로직을 추가하세요
// 예: HTTP 요청을 통해 서버에 파일 업로드
          } else {
// 사용자가 파일 선택을 취소한 경우
            print("File selection cancelled");
          }
        } else {
// 웹 환경이 아닌 경우에 대한 처리
          print("This feature is only available in web environment.");
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2260FF),
      ),
      child: const Text(
        "Browse \n My files",
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    );
  }
}
