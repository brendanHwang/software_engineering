import 'package:software_engineering/constants/AppConst.dart';
import 'package:software_engineering/constants/AppString.dart';

// regDate 삭제& purchasedDateTime 추가
class Content {
  String userID;
  int fileDescriptor; // 자료 id
  String filePath;
  String contentType;
  String title;
  String fileName; // 자료 이름
  String department;
  int soldNum;
  Map<String, int> review;
  String? profName;
  DateTime? contentYear; // 자료년도
  DateTime uploadDateTime; // 자료 업로드 날짜
  DateTime? purchasedDateTime; // 자료 다운로드 날짜 (다운로든는 nullalbe)

  Content(
      {required this.userID,
      required this.fileDescriptor,
      required this.filePath,
      required this.contentType,
      required this.title,
      required this.fileName,
      required this.department,
      required this.soldNum,
      required this.review,
      this.profName,
      this.contentYear,
      required this.uploadDateTime,
      this.purchasedDateTime});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
        userID: json['userID'],
        fileDescriptor: json['fileDescriptor'],
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
            : DateTime.parse(json['contentYear']),
        uploadDateTime: DateTime.parse(json['uploadDateTime']),
        purchasedDateTime: json['purchasedDateTime'] == null
            ? null
            : DateTime.parse(json['purchasedDateTime']));
  }

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'fileDescriptor': fileDescriptor,
        'filePath': filePath,
        'contentType': contentType,
        'title': title,
        'fileName': fileName,
        'department': department,
        'soldNum': soldNum,
        'review': review,
        'profName': profName,
        'contentYear':
            contentYear == null ? null : contentYear!.toIso8601String(),
        'uploadDateTime': uploadDateTime.toIso8601String(),
        'purchasedDateTime': purchasedDateTime == null
            ? null
            : purchasedDateTime!.toIso8601String(),
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
}
