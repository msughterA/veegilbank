import 'dart:io';

import 'package:dio/dio.dart';
import 'package:veegilbank/features/mobilebank/data/data_sources/remote/bank_api_service.dart';
import 'package:veegilbank/features/mobilebank/domain/repository/transaction_repository.dart';
import 'dart:async';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/transaction.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final BankApiService _bankApiService;
  TransactionRepositoryImpl(this._bankApiService);
  @override
  Future<DataState<List<TransactionEntity>>> getTransactions() async {
    try {
      final httpResponse = await _bankApiService.getTransactions();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
