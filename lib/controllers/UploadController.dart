import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:software_engineering/models/Content.dart';
import 'package:software_engineering/utils/firebase_firestore_util.dart';

class UploadController extends GetxController {
  // 선택된 파일들을 저장할 리스트
  var selectedFile = Rx<PlatformFile?>(null);
  var content = Content();

  // 파일을 추가하는 메서드
  void addFile(PlatformFile files) {
    selectedFile.value = files;
    print('Selected file: ${selectedFile.value!.name}');
    content.fileName = selectedFile.value!.name;
  }

  // TODO firbase storage에 저장하는 것을 구현 (최종 Content정보와 함깨)
  Future<void> upload() async {

    if(content.uploadValidation()){ // 업로드 유효성 검사
      await uploadContent();
    }
  }

  void reset(){
    selectedFile.value = null;
    content = Content();
  }
}
