import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String? type;
  final String? amount;
  final String? phoneNumber;
  final String? created;
  const TransactionEntity({
    this.type,
    this.amount,
    this.created,
    this.phoneNumber,
  });
  @override
  List<Object?> get props {
    return [type, amount, created, phoneNumber];
  }
}
