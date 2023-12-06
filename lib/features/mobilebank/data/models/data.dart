import 'package:veegilbank/features/mobilebank/domain/entities/data.dart';

class DataModel extends DataEntity {
  DataModel({
    String? status,
    String? message,
    String? data,
  }) : super(data: data, status: status, message: message);

  factory DataModel.fromJson(Map<String, dynamic> map) {
    return DataModel(
      status: map['status'],
      message: map['message'],
      data: map['data'],
    );
  }
}
