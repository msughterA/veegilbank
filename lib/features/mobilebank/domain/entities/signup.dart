import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final String? phoneNumber;
  final String? created;
  const SignUpEntity({this.created, this.phoneNumber});

  @override
  List<Object?> get props {
    return [
      phoneNumber,
      created,
    ];
  }
}
