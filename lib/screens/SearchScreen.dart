import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppConst.dart';
import 'package:software_engineering/controllers/AppSearchController.dart';
import 'package:software_engineering/screens/Screen.dart';
import 'package:software_engineering/widgets/SearchScreen/AppSearchBar.dart';
import 'package:software_engineering/widgets/SearchScreen/ContentCard.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isDark = false;
  String sortValue = "최신순";
  final appSearchController = Get.find<AppSearchController>();

  @override
  Widget build(BuildContext context) {
    return Screen(
        isScrollable: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: AppSearchBar(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('검색 결과',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    const Spacer(),
                    Obx(() => DropdownButton<String>(
                          borderRadius: BorderRadius.circular(10),
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 20, right: 20),
                          value: appSearchController.sortValue.value,
                          items: const [
                            DropdownMenuItem<String>(
                              value: "최신순",
                              child: Text(
                                "최신순",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "리뷰순",
                              child: Text(
                                "리뷰순",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              appSearchController.sortValue.value = value!;
                              appSearchController.sort();
                            });
                          },
                        )),
                    const SizedBox(
                      width: 30,
                    ),
                    Obx(() => DropdownButton<String>(
                          borderRadius: BorderRadius.circular(10),
                          padding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 20, right: 20),
                          value: appSearchController.filterValue.value,
                          items: const [
                            DropdownMenuItem<String>(
                              value: "전체",
                              child: Text(
                                "전체",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "전공",
                              child: Text(
                                "전공",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "교양",
                              child: Text(
                                "교양",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: "취업자료",
                              child: Text(
                                "취업자료",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              appSearchController.filterValue.value = value!;
                              appSearchController.filter();
                            });
                          },
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(() => Expanded(
                  child: ListView.builder(
                      itemCount:
                          appSearchController.filteredContents.value.length,
                      itemBuilder: (context, index) {
                        return ContentCard(
                            index: index,
                            content: appSearchController.filteredContents.value[
                                index]); // TODO: contents 부분은 현재 hard coding 되어있음
                      }),
                ))
          ],
        ));
  }
}
