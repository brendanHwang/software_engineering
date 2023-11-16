import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppPadding.dart';
import 'package:software_engineering/constants/AppSize.dart';
import 'package:software_engineering/widgets/Screen/CustomAppBar.dart';

class Screen extends StatefulWidget {
  final Widget child;
  final bool isScrollable;
  final bool hasFloatingButton;
  final PreferredSize? appBar;

  const Screen({Key? key, required this.child, this.isScrollable = true, this.hasFloatingButton = true, this.appBar = const PreferredSize(
    preferredSize: Size.fromHeight(AppSize.navigationTabHeight),
    child: CustomAppBar(),
  ) })
      : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Container(
        width: Get.width,
          height: Get.height - AppSize.navigationTabHeight,
        padding: const EdgeInsets.only(
            top: AppPadding.topPadding,
            left: AppPadding.horizontalPadding,
            right: AppPadding.horizontalPadding),
        child: widget.isScrollable
            ? SingleChildScrollView(
                child: widget.child,
              )
            : SizedBox(
          width: double.infinity,
            height: double.infinity,
            child: widget.child),
      ),

      floatingActionButton: widget.hasFloatingButton? FloatingActionButton(
        backgroundColor: Colors.black, // 배경색: 검은색
        onPressed: () {
          // 버튼을 눌렀을 때의 추가적인 동작
          //Get.to(() => WritingPage()); // WritingPage로 이동??
        },
        child: Icon(
          Icons.add, // 돋보기 아이콘
          color: Colors.white, // 아이콘 색상
        ),
      ) : null,
    );
  }
}
