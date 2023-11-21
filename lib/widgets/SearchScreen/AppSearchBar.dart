import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/controllers/AppSearchController.dart';

class AppSearchBar extends StatefulWidget {
  AppSearchBar({Key? key}) : super(key: key);

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final appSearchController = Get.find<AppSearchController>();

  final SearchController controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: controller,
      viewLeading: IconButton(
        onPressed: () {
          if(controller.text.isNotEmpty) {
            // print("search: ${controller.text}");
            appSearchController.search(controller.text);
          }
          controller.closeView(controller.text);
        },
        icon: const Icon(Icons.search),
      ),
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          onSubmitted: (String value) {
            controller.closeView(value);
          },
          trailing: <Widget>[
            IconButton(
                onPressed: () {
                  controller.openView();
                },
                icon: const Icon(Icons.search)),
          ],
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(
            appSearchController.searchHistory.value.length, (index) {
          return ListTile(
            title:
                Obx(() => Text(appSearchController.searchHistory.value[index])),
            onTap: () {
              controller
                  .closeView(appSearchController.searchHistory.value[index]);
            },
          );
        });
      },
    );
  }
}
