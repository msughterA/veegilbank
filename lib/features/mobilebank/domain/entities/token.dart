import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  final String? token;
  const TokenEntity({this.token});

  @override
  List<Object?> get props {
    return [token];
  }
}
