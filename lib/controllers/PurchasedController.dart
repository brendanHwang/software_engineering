import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:software_engineering/constants/AppConst.dart';
import 'package:software_engineering/models/Content.dart';

class PurchasedController extends GetxController{

  Stream<List<Content>> getContentStream() async* {
    List<Content> contents = AppConst.purchasedContents;

    await Future.delayed(const Duration(milliseconds: 1)); // 딜레이를 추가합니다.
    yield contents; // 전체 리스트를 스트림으로 보냅니다.
  }
}