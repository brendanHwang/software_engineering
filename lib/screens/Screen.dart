import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen extends StatefulWidget {
  final Widget child;

  Screen({Key? key, required this.child}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          // 추가된 부분
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // 여기서 Scaffold.of()를 사용
            },
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/logo2.png',
              fit: BoxFit.contain,
              height: Get.height * 0.05,
            ),
          ),
          Positioned(
            top: Get.height * 0.1,
            left: Get.width * 0.1,
            right: Get.width * 0.1,
            child: Container(
                width: Get.width,
                height: Get.height * 0.8,
                child: SingleChildScrollView(
                  child: widget.child,
                )),
          )
        ],
      ),
     
    );
  }
}
