import 'package:get/get.dart';
import 'package:software_engineering/models/PurchasedContent.dart';
import 'package:software_engineering/utils/firebase_firestore_util.dart' as fbu;

class PurchasedController extends GetxController{

  List<PurchasedContent> purchasedContents = [];

    Future<void> getPurchasedContents() async{
     await fbu.getPurchasedContents();
     for (var i = 0; i < purchasedContents.length; i++) {
       print(purchasedContents[i].toString());
     }
  }


}