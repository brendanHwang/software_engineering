import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppConst.dart';
import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/screens/upload/UploadScreen.dart';

// regDate 삭제& purchasedDateTime 추가
class Content {
  String? userID; // 자료 업로드한 사용자 id
  String? fileDescription; // 자료 설명
  String? filePath; // firebase storage에 저장된 파일 경로
  String? contentType; // 자료 종류 (전공,교양, 취업 자료, 기타)
  String? title; // 자료 제목
  String? fileName; // 자료 이름
  String? department; // 학과
  int soldNum;
  Map<String, int> review;
  String? profName; // 교수 이름
  DateTime? contentYear; // 자료년도
  DateTime? uploadDateTime; // 자료 업로드 날짜
  DateTime? purchasedDateTime; // 자료 다운로드 날짜 (다운로든는 nullalbe)

  Content(
      {this.userID,
      this.fileDescription,
      this.filePath,
      this.contentType,
      this.title,
      this.fileName,
      this.department,
      this.soldNum = 0,
      this.review = const {
        AppString.like: 0,
        AppString.normal: 0,
        AppString.dislike: 0,
      },
      this.profName,
      this.contentYear,
      this.uploadDateTime,
      this.purchasedDateTime});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      userID: json['userID'],
      fileDescription: json['fileDescription'],
      filePath: json['filePath'],
      contentType: json['contentType'],
      title: json['title'],
      fileName: json['fileName'],
      department: json['department'],
      soldNum: json['soldNum'],
      review: json['review'],
      profName: json['profName'],
      contentYear: json['contentYear'] == null
          ? null
          : (json['contentYear'] as Timestamp).toDate(),
      uploadDateTime: json['uploadDateTime'] == null
          ? null
          : (json['uploadDateTime'] as Timestamp).toDate(),
      purchasedDateTime: json['purchasedDateTime'] == null
          ? null
          : (json['purchasedDateTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
    'userID': userID,
    'fileDescription': fileDescription,
    'filePath': filePath,
    'contentType': contentType,
    'title': title,
    'fileName': fileName,
    'department': department,
    'soldNum': soldNum,
    'review': review,
    'profName': profName,
    'contentYear': contentYear == null ? null : Timestamp.fromDate(contentYear!),
    'uploadDateTime': uploadDateTime == null ? null : Timestamp.fromDate(uploadDateTime!),
    'purchasedDateTime': purchasedDateTime == null ? null : Timestamp.fromDate(purchasedDateTime!),
  };

  String getReviewString(String key) {
    if (review[key]! < 10) {
      return '  ${review[key]}';
    } else if (review[key]! < 100)
      return ' ${review[key]}';
    else if (review[key]! < 1000)
      return '${review[key]}';
    else
      return '999+';
  }

  int totalReviewScore() {
    int total = 0;
    review.forEach((key, value) {
      if (key == AppString.like) {
        total += (value * 1);
      } else if (key == AppString.normal) {
        total += (value * 0);
      } else {
        total += (value * -1);
      }
    });
    return total;
  }

  int getSoldNum() {
    return soldNum;
  }

  void setContentTypeToString({required int contentTypeIdx}) {
    switch (contentTypeIdx) {
      case 0:
        contentType = '전공';
        break;
      case 1:
        contentType = '교양';
        break;
      case 2:
        contentType = '취업자료';
        break;
      case 3:
        contentType = '기타';
        break;
      default:
        contentType = '전공';
        break;
    }
  }

  /// 필수 항목에 대한 검사 진행
  /// 필수 항목 - title, contentType, fileName, department, fileDescription
  bool uploadValidation() {
    if (title == null || title!.isEmpty) {
      Get.snackbar("업로드 실패", "제목을 입력해주세요");
      return false;
    }
    if (contentType == null || contentType!.isEmpty) {
      Get.snackbar("업로드 실패", "자료 유형을 선택해주세요");
      return false;
    }
    if (fileName == null || fileName!.isEmpty) {
      Get.snackbar("업로드 실패", "파일을 드래그앤드롭 하여 올려주세요");
      Get.to(UploadScreen());
      return false;
    }
    if (department == null || department!.isEmpty) {
      Get.snackbar("업로드 실패", "학과를 입력해주세요");
      return false;
    }
    if (fileDescription == null || fileDescription!.isEmpty) {
      Get.snackbar("업로드 실패", "자료 내용을 입력해주세요");
      return false;
    }
    return true;
  }

  @override
  String toString() {
    return 'userID: $userID, fileDescription: $fileDescription, filePath: $filePath, contentType: $contentType, title: $title, fileName: $fileName, department: $department, soldNum: $soldNum, review: $review, profName: $profName, contentYear: $contentYear, uploadDateTime: $uploadDateTime, purchasedDateTime: $purchasedDateTime';
  }
}
