import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:veegilbank/features/mobilebank/data/data_sources/local/cache_service.dart';
import 'package:veegilbank/features/mobilebank/data/data_sources/remote/bank_api_service.dart';
import 'package:veegilbank/features/mobilebank/data/models/signup.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/detail.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/signup.dart';
import 'package:veegilbank/features/mobilebank/domain/entities/token.dart';
import 'package:veegilbank/features/mobilebank/domain/repository/auth_repository.dart';

import '../../../../core/resources/data_state.dart';

class AuthRepositoryImpl implements AuthRepository {
  final BankApiService _bankApiService;
  final CacheService _cacheService;
  AuthRepositoryImpl(this._bankApiService, this._cacheService);

  @override
  Future<DataState<List<DetailEntity>>> getDetail() async {
    try {
      final httpResponse = await _bankApiService.getDetail();
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

  @override
  Future<DataState<TokenEntity>> login(Map<String, dynamic> map) async {
    try {
      final httpResponse = await _bankApiService.login(map);
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

  @override
  Future<DataState<SignUpEntity>> signUp(Map<String, dynamic> map) async {
    try {
      final httpResponse = await _bankApiService.signUp(map);
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

  @override
  bool checkCache() {
    // TODO: implement checkCache
    return _cacheService.isCacheEmpty();
  }

  @override
  SignUpModel getProfileFromCache() {
    // TODO: implement getProfileFromCache
    return _cacheService.getSavedProfile();
  }

  @override
  Future<void> saveProfileToCache(SignUpModel signUpModel) {
    // TODO: implement saveProfileToCache
    return _cacheService.saveProfile(signUpModel);
  }

  @override
  Future<void> clearCache() {
    return _cacheService.clearCache();
  }
}
