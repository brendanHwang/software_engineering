import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:software_engineering/models/Content.dart';

class PurchasedContent{
  Content content;
  DateTime purchasedDateTime;
  int? review;

  PurchasedContent({required this.content,required this.purchasedDateTime,required this.review});

  factory PurchasedContent.fromJson(Map<String, dynamic> json) {
    return PurchasedContent(
      content: Content.fromJson(json['content']),
      purchasedDateTime: (json['purchasedDateTime'] as Timestamp).toDate(),
      review: json['review'],
    );
  }

  Map<String, dynamic> toJson() => {
    'content': content.toJson(),
    'purchasedDateTime':  Timestamp.fromDate(purchasedDateTime),
    'review': review,
  };

  @override
  String toString() {
    return 'PurchasedContent{content: $content, purchasedDateTime: $purchasedDateTime, review: $review}';
  }
}