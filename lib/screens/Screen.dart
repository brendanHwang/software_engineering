import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppPadding.dart';
import 'package:software_engineering/constants/AppSize.dart';
import 'package:software_engineering/widgets/Screen/CustomAppBar.dart';

class Screen extends StatefulWidget {
  final Widget child;
  final bool isScrollable;

  const Screen({Key? key, required this.child, this.isScrollable = true})
      : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppSize.navigationTabHeight),
        child: CustomAppBar(),
      ),
      body: Column(
        children: [
          Container(
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
                child: widget.child),
          ),
        ],
      ),
    );
  }
}
