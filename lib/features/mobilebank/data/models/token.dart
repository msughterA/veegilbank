import 'package:veegilbank/features/mobilebank/domain/entities/token.dart';

class TokenModel extends TokenEntity {
  const TokenModel({
    String? token,
  }) : super(
          token: token,
        );
  factory TokenModel.fromJson(Map<String, dynamic> map) {
    return TokenModel(
      token: map['token'] ?? "",
    );
  }
}
