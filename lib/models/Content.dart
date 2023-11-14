import 'package:software_engineering/constants/AppConst.dart';
import 'package:software_engineering/constants/AppString.dart';

class Content {
  String userID;
  int fileDescriptor; // 자료 id
  String filePath;
  String contentType;
  String title;
  String fileName; // 자료 이름
  String department;
  String regDate;
  int soldNum;
  Map<String, int> review;
  String? profName;
  DateTime? contentYear; // 자료년도
  DateTime uploadDateTime; // 자료 업로드 날짜

  Content(
      {required this.userID,
      required this.fileDescriptor,
      required this.filePath,
      required this.contentType,
      required this.title,
      required this.fileName,
      required this.department,
      required this.regDate,
      required this.soldNum,
      required this.review,
      this.profName,
      this.contentYear,
      required this.uploadDateTime});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
        userID: json['userID'],
        fileDescriptor: json['fileDescriptor'],
        filePath: json['filePath'],
        contentType: json['contentType'],
        title: json['title'],
        fileName: json['fileName'],
        department: json['department'],
        regDate: json['regDate'],
        soldNum: json['soldNum'],
        review: json['review'],
        profName: json['profName'],
        contentYear: json['contentYear'] == null
            ? null
            : DateTime.parse(json['contentYear']),
        uploadDateTime: DateTime.parse(json['uploadDateTime']));
  }

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'fileDescriptor': fileDescriptor,
        'filePath': filePath,
        'contentType': contentType,
        'title': title,
        'fileName': fileName,
        'department': department,
        'regDate': regDate,
        'soldNum': soldNum,
        'review': review,
        'profName': profName,
        'contentYear':
            contentYear == null ? null : contentYear!.toIso8601String(),
        'uploadDateTime': uploadDateTime.toIso8601String()
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
