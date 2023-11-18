import 'package:get/get.dart';
import 'package:software_engineering/constants/AppConst.dart';
import 'package:software_engineering/models/Content.dart';

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

  void search(String keyword) {
    if (keyword.length < 2) {
      Get.snackbar('검색어 오류', '검색어는 2글자 이상이어야 합니다.');
      return;
    }

    // TODO: 실제로 firebase를 호출하는 함수를 구현해야됨 아직은 hard coding
    searchedContents.value = AppConst.searchedContents
        .where((element) => element.title.contains(keyword))
        .toList();
    filter();
    sort();
    searchHistory.addIf(!searchHistory.contains(keyword), keyword);
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
      sortedList.sort((a, b) => b.uploadDateTime.compareTo(a.uploadDateTime));
      // print('최신순 정렬');
      // for (var i = 0; i < sortedList.length; i++) {
      //   print('${sortedList[i].title}:  ${sortedList[i].uploadDateTime}');
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
