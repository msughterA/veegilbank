import 'package:veegilbank/features/mobilebank/domain/entities/detail.dart';

class DetailModel extends DetailEntity {
  DetailModel({
    String? phoneNumber,
    String? created,
    String? balance,
  }) : super(
          balance: balance,
          created: created,
          phoneNumber: phoneNumber,
        );

  factory DetailModel.fromJson(Map<String, dynamic> map) {
    return DetailModel(
        phoneNumber: map['phoneNumber'] ?? "",
        created: map['created'] ?? "",
        balance: map['balance'] ?? "");
  }
}
