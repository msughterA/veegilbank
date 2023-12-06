import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:veegilbank/core/constants/constants.dart';
import 'package:veegilbank/features/mobilebank/data/models/detail.dart';
import 'package:veegilbank/features/mobilebank/data/models/signup.dart';
import 'package:veegilbank/features/mobilebank/data/models/token.dart';
import 'dart:async';

import 'package:veegilbank/features/mobilebank/data/models/transaction.dart';
part 'bank_api_service.g.dart';

@RestApi(baseUrl: bankApiBaseUrl)
abstract class BankApiService {
  factory BankApiService(Dio dio) = _BankApiService;

  @GET('/transactions')
  Future<HttpResponse<List<TransactionModel>>> getTransactions();

  @POST('/auth/login')
  Future<HttpResponse<TokenModel>> login(@Body() Map<String, dynamic> map);

  @POST('/auth/signup')
  Future<HttpResponse<SignUpModel>> signUp(@Body() Map<String, dynamic> map);

  @POST('/withdraw')
  Future<HttpResponse<void>> withdraw(@Body() Map<String, dynamic> map);

  @POST('/transfer')
  Future<HttpResponse<void>> transfer(@Body() Map<String, dynamic> map);

  @GET('/accounts')
  Future<HttpResponse<List<DetailModel>>> getDetail();
}
