import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/UploadController.dart';

Future<void> uploadFile() async {
  final uploadController = Get.find<UploadController>();

  if (uploadController.selectedFile.value != null) {
    final file = uploadController.selectedFile.value!;
    final fileName = file.name;
    final data = file.bytes;

    if (data != null) {
      try {
        String filePath = 'content/$fileName';
        // 파일 업로드
        TaskSnapshot uploadTask = await FirebaseStorage.instance.ref(filePath).putData(data);

        // 업로드한 파일의 다운로드 URL을 가져옵니다.
        String downloadUrl = await uploadTask.ref.getDownloadURL();

        // 다운로드 URL을 UploadController의 변수에 저장합니다.
        uploadController.content.filePath = downloadUrl;

        print('File uploaded successfully: $downloadUrl');
      } catch (e) {
        print('Error uploading file: $e');
      }
    } else {
      print('No data found to upload');
    }
  } else {
    print('No file selected');
  }
}
