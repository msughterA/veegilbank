import 'package:equatable/equatable.dart';

class DetailEntity extends Equatable {
  final String? phoneNumber;
  final String? balance;
  final String? created;
  const DetailEntity({
    this.phoneNumber,
    this.balance,
    this.created,
  });

  @override
  List<Object?> get props {
    return [phoneNumber, balance, created];
  }
}
