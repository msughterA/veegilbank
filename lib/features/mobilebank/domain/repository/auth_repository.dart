import 'package:veegilbank/core/resources/data_state.dart';
import 'package:veegilbank/features/mobilebank/data/models/signup.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/detail.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/signup.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/token.dart';

abstract class AuthRepository {
  // API methods
  /// Method to login and get [TokenEntity] then save it to shared preferences
  Future<DataState<TokenEntity>> login(Map<String, dynamic> map);

  /// Method to signUp and get [SignUpEntity] then save it to shared preferences
  Future<DataState<SignUpEntity>> signUp(Map<String, dynamic> map);

  // Cache Methods

  /// Method to get account [Detail] from the backend
  Future<DataState<List<DetailEntity>>> getDetail();

  /// Method to check if the [CacheService] is empty
  bool checkCache();

  /// Method to save profile details to [CacheService]
  Future<void> saveProfileToCache(SignUpModel signUpModel);

  /// Method to get profile details from [CacheService]
  SignUpModel getProfileFromCache();

  /// Method to clear the [CacheService]
  Future<void> clearCache();
}
