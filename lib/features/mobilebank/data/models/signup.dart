import 'package:veegilbank/features/mobilebank/domain/entities/signup.dart';

class SignUpModel extends SignUpEntity {
  SignUpModel({String? phoneNumber, String? created})
      : super(created: created, phoneNumber: phoneNumber);

  factory SignUpModel.fromJson(Map<String, dynamic> map) {
    return SignUpModel(
      phoneNumber: map['phoneNumber'] ?? "",
      created: map['created'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'created': created,
      // Add other properties if there are more in your class
    };
  }
}
