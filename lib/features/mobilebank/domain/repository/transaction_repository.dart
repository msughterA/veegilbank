import 'package:veegilbank/core/resources/data_state.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/transaction.dart';

abstract class TransactionRepository {
  /// Method to get [TransactionEntity] from backend
  Future<DataState<List<TransactionEntity>>> getTransactions();
}
