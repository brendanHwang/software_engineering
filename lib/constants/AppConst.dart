import 'package:software_engineering/constants/AppString.dart';
import 'package:software_engineering/models/Content.dart';

class AppConst {
  static List<Content> searchedContents = [
    Content(
        userID: '1',
        fileDescriptor: 10,
        filePath: 'filePath1',
        contentType: '전공',
        title: '자료구조 중간고사',
        fileName: 'fileName1',
        department: '컴퓨터소프트웨어학부',
        soldNum: 10,
        review: {
          AppString.like: 10,
          AppString.normal: 3,
          AppString.dislike: 7,
        },
        profName: '노미나',
        contentYear: DateTime.now(),
        uploadDateTime: DateTime.now()),
    Content(
      userID: '2',
      fileDescriptor: 8,
      filePath: 'filePath2',
      contentType: '교양',
      title: '프랑스 문화 관광 기말고사',
      fileName: 'fileName2',
      department: '불어불문과',
      soldNum: 10,
      review: {
        AppString.like: 15,
        AppString.normal: 1,
        AppString.dislike: 7,
      },
      profName: '최이현',
      // contentYear: DateTime.now()
      uploadDateTime: DateTime.now(),
    ),
    Content(
      userID: '3',
      fileDescriptor: 9,
      filePath: 'filePath3',
      contentType: '취업자료',
      title: '카카오 코딩 테스트 합격자 후기',
      fileName: 'fileName3',
      department: '컴퓨터소프트웨어학부',
      soldNum: 10,
      review: {
        AppString.like: 0,
        AppString.normal: 2,
        AppString.dislike: 10,
      },
      // profName: 'profName',
      // contentYear: DateTime.now(),
      uploadDateTime: DateTime.now(),
    ),
    Content(
      userID: '4',
      fileDescriptor: 7,
      filePath: 'filePath4',
      contentType: '전공',
      title: '컴퓨터 그래픽스 기말고사',
      fileName: 'fileName4',
      department: '컴퓨터소프트웨어학부',
      soldNum: 10,
      review: {
        AppString.like: 30,
        AppString.normal: 2,
        AppString.dislike: 1,
      },
      profName: '권태수',
      contentYear: DateTime.now(),
      uploadDateTime: DateTime.now(),
    ),
    Content(
      userID: '5',
      fileDescriptor: 6,
      filePath: 'filePath5',
      contentType: '교양',
      title: '영화 감상평',
      fileName: 'fileName5',
      department: '영어영문학과',
      soldNum: 10,
      review: {
        AppString.like: 3,
        AppString.normal: 10,
        AppString.dislike: 1,
      },
      profName: '김영희',
      contentYear: DateTime.now(),
      uploadDateTime: DateTime.now(),
    ),
    Content(
      userID: '6',
      fileDescriptor: 5,
      filePath: 'filePath6',
      contentType: '취업자료',
      title: '삼성 코딩 테스트 합격자 후기',
      fileName: 'fileName6',
      department: '전자전기',
      soldNum: 10,
      review: {
        AppString.like: 3,
        AppString.normal: 2,
        AppString.dislike: 1,
      },
      profName: '하영훈',
      contentYear: DateTime.now(),
      uploadDateTime: DateTime.now(),
    ),
    Content(
      userID: '7',
      fileDescriptor: 4,
      filePath: 'filePath7',
      contentType: '전공',
      title: '알고리즘 중간고사',
      fileName: 'fileName7',
      department: '컴퓨터소프트웨어학부',
      soldNum: 10,
      review: {
        AppString.like: 10000,
        AppString.normal: 0,
        AppString.dislike: 6,
      },
      profName: '조규빈',
      contentYear: DateTime.now(),
      uploadDateTime: DateTime.now(),
    ),
    Content(
      userID: '8',
      fileDescriptor: 3,
      filePath: 'filePath8',
      contentType: '교양',
      title: '전문학술 영어 기말고사',
      fileName: 'fileName8',
      department: '영어영문과',
      soldNum: 10,
      review: {
        AppString.like: 10,
        AppString.normal: 3,
        AppString.dislike: 7,
      },
      profName: '박재찬',
      contentYear: DateTime.now(),
      uploadDateTime: DateTime.now(),
    ),
    Content(
      userID: '8',
      fileDescriptor: 1,
      filePath: 'filePath8',
      contentType: '교양',
      title: '자료구조 기말고사',
      fileName: 'fileName8',
      department: '전자전기과',
      soldNum: 10,
      review: {
        AppString.like: 0,
        AppString.normal: 3,
        AppString.dislike: 7,
      },
      profName: '박재찬',
      contentYear: DateTime.now(),
      uploadDateTime: DateTime.now().add(const Duration(days: 1)),
    ),

  ];
  static List<Content> purchasedContents = [
    Content(
        userID: '1',
        fileDescriptor: 10,
        filePath: 'filePath1',
        contentType: '전공',
        title: '자료구조 중간고사',
        fileName: 'fileName1',
        department: '컴퓨터소프트웨어학부',
        soldNum: 10,
        review: {
          AppString.like: 10,
          AppString.normal: 3,
          AppString.dislike: 7,
        },
        profName: '노미나',
        contentYear: DateTime.now(),
        uploadDateTime: DateTime.now(),
        purchasedDateTime: DateTime.now().subtract(const Duration(days: 1))
      ),
    Content(
      userID: '2',
      fileDescriptor: 8,
      filePath: 'filePath2',
      contentType: '교양',
      title: '프랑스 문화 관광 기말고사',
      fileName: 'fileName2',
      department: '불어불문과',
      soldNum: 10,
      review: {
        AppString.like: 15,
        AppString.normal: 1,
        AppString.dislike: 7,
      },
      profName: '최이현',
      // contentYear: DateTime.now()
      uploadDateTime: DateTime.now(),
      purchasedDateTime: DateTime.now().subtract(const Duration(days: 2))
    ),
    Content(
      userID: '3',
      fileDescriptor: 9,
      filePath: 'filePath3',
      contentType: '취업자료',
      title: '카카오 코딩 테스트 합격자 후기',
      fileName: 'fileName3',
      department: '컴퓨터소프트웨어학부',
      soldNum: 10,
      review: {
        AppString.like: 0,
        AppString.normal: 2,
        AppString.dislike: 10,
      },
      // profName: 'profName',
      // contentYear: DateTime.now(),
      uploadDateTime: DateTime.now(),
      purchasedDateTime: DateTime.now().subtract(const Duration(days: 3))
    ),
    Content(
      userID: '4',
      fileDescriptor: 7,
      filePath: 'filePath4',
      contentType: '전공',
      title: '컴퓨터 그래픽스 기말고사',
      fileName: 'fileName4',
      department: '컴퓨터소프트웨어학부',
      soldNum: 10,
      review: {
        AppString.like: 30,
        AppString.normal: 2,
        AppString.dislike: 1,
      },
      profName: '권태수',
      contentYear: DateTime.now(),
      uploadDateTime: DateTime.now(),
      purchasedDateTime: DateTime.now().subtract(const Duration(days: 4))
    ),
  ];
}
