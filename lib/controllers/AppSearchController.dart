import 'package:get/get.dart';
import 'package:software_engineering/models/Content.dart';
import 'package:software_engineering/utils/firebase_firestore_util.dart';

class AppSearchController extends GetxController {
  final searchedContents = <Content>[].obs;
  final filteredContents = <Content>[].obs;
  final filterValue = '전체'.obs;
  final sortValue = '최신순'.obs;
  final searchHistory = <String>[].obs;

  Rx<Content>? selectedContent;

  void selectContent(Content content) {
    selectedContent = content.obs;
  }

  Future<bool> search(String keyword) async {

    if (keyword == ' ' || keyword == '') {
      Get.snackbar('검색어 오류', '원하는 검색어를 입력해주세요.');
      return false;
    }else if (keyword.length < 2) {
      Get.snackbar('검색어 오류', '검색어는 2글자 이상이어야 합니다.');
      return false;
    }else if (keyword.length > 10) {
      Get.snackbar('검색어 오류', '검색어는 10글자 이하이어야 합니다.');
      return false;
    }

    await searchContent(keyword);

    filteredContents.value = searchedContents;
    filter();
    // for(var i = 0; i < filteredContents.length; i++) {
    //   print(filteredContents[i].toString());
    // }
    sort();
    if(filteredContents.isEmpty) {
      Get.snackbar('검색 결과 없음', '검색 결과가 없습니다.');
      return false;
    }

    searchHistory.addIf(!searchHistory.contains(keyword), keyword);


    // print('검색 결과');
    // for(var i = 0; i < filteredContents.length; i++) {
    //   print(filteredContents[i].title);
    // }
    return true;
  }

  void filter() {
    filteredContents.value = filterValue.value == '전체'
        ? List<Content>.from(searchedContents)
        : searchedContents
            .where((element) => element.contentType == filterValue.value)
            .toList();
  }

  void sort() {
    var sortedList = List<Content>.from(filteredContents); // 새 리스트를 생성합니다.

    if (sortValue.value == '최신순') {
      // 최신순으로 정렬합니다.
      sortedList.sort((a, b) => b.uploadDateTime!.compareTo(a.uploadDateTime!));
      // print('최신순 정렬');
      // for (var i = 0; i < sortedList.length; i++) {
      //   print('${sortedList[i].title}:  ${sortedList[i].uploadDateTime}');
      // }
    } else if (sortValue.value == '리뷰순') {
      // 리뷰 점수 순으로 정렬합니다.
      sortedList
          .sort((a, b) => b.totalReviewScore().compareTo(a.totalReviewScore()));
      // print('리뷰순 정렬');
      // for (var i = 0; i < sortedList.length; i++) {
      //   print('${sortedList[i].title}:  ${sortedList[i].totalReviewScore()}');
      // }
    }
    filteredContents.assignAll(sortedList);
  }
}
