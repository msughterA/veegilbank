import 'package:veegilbank/features/mobilebank/domain/entities/transaction.dart';

class TransactionModel extends TransactionEntity {
  TransactionModel(
      {String? type, String? amount, String? phoneNumber, String? created})
      : super(
            amount: amount,
            type: type,
            phoneNumber: phoneNumber,
            created: created);

  factory TransactionModel.fromJson(Map<String, dynamic> map) {
    return TransactionModel(
        type: map['type'] ?? "",
        amount: map['amount'] ?? "",
        phoneNumber: map['phoneNumber'] ?? "",
        created: map['created'] ?? "");
  }

  factory TransactionModel.fromEntity(TransactionEntity entity) {
    return TransactionModel(
        type: entity.type,
        amount: entity.amount,
        phoneNumber: entity.phoneNumber,
        created: entity.created);
  }
}
