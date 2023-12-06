import 'package:veegilbank/core/resources/data_state.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/detail.dart';

abstract class DetailRepository {
  /// Method to get the [DetailEntity] from shared preferences
  Future<DataState<DetailEntity>> getDetail();

  /// Method to clear the [DetailEntity] from shared preferences
  Future<void> clearDetail();

  /// Method to save the [DetailEntity] to shared preferences
  Future<void> saveDetail();
}
