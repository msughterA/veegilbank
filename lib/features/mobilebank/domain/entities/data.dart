import 'package:equatable/equatable.dart';

class DataEntity extends Equatable {
  final String? status;
  final String? message;
  final String? data;
  const DataEntity({
    this.status,
    this.message,
    this.data,
  });

  @override
  List<Object?> get props {
    return [
      data,
      message,
      status,
    ];
  }
}
