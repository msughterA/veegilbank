import 'package:flutter/material.dart';
import 'package:veegilbank/core/resources/data_state.dart';
import 'package:veegilbank/features/mobilebank/data/models/signup.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/check_cache_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/clear_cache_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/get_saved_profile_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/login_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/save_profile_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/signup_usecase.dart';
import 'package:veegilbank/features/mobilebank/presentation/providers/auth/auth_provider_state.dart';

import 'auth_provider_data.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final CheckCacheUseCase checkCacheUseCase;
  final ClearCacheUseCase clearCacheUseCase;
  final GetSavedProfileUseCase getSavedProfileUseCase;
  final SaveProfileUseCase saveProfileUseCase;
  AuthProvider(
      {required this.loginUseCase,
      required this.signUpUseCase,
      required this.checkCacheUseCase,
      required this.clearCacheUseCase,
      required this.getSavedProfileUseCase,
      required this.saveProfileUseCase});

  // Initial State
  AuthProviderState _state = AuthProviderState.login;
  final AuthProviderData _data = AuthProviderData();

  // Getter accessing state
  AuthProviderState get state => _state;
  AuthProviderData get data => _data;

  // Setters
  set state(AuthProviderState authProviderState) {
    _state = authProviderState;
    notifyListeners();
  }

  // Go to login page
  void goToLogin() {
    _state = AuthProviderState.login;
    notifyListeners();
  }

  // Go to signUp page
  void goToSignUp() {
    _state = AuthProviderState.signUp;
    notifyListeners();
  }

  // signUp
  Future<void> signUp(String phoneNumber, String password) async {
    final dataState = await signUpUseCase(params: {
      'phoneNumber': phoneNumber,
      'password': password,
    });

    if ((dataState is DataSuccess) && (dataState.data != null)) {
      /// change the [AuthProviderState] to home
      _state = AuthProviderState.home;

      /// save the sign up details to cache
      final signUpModel = SignUpModel(
        created: dataState.data!.created,
        phoneNumber: dataState.data!.phoneNumber,
      );
      await saveProfileUseCase(params: signUpModel);
      notifyListeners();
    } else if (dataState is DataFailed) {
      _data.providerData = dataState.exception!.response!.data['message'];
      notifyListeners();
    } else {
      _data.providerData = 'An error occured';
      notifyListeners();
    }
  }

  // login
  Future<void> login(String phoneNumber, String password) async {
    _state = AuthProviderState.loading;
    notifyListeners();
    final dataState = await loginUseCase(params: {
      'phoneNumber': phoneNumber,
      'password': password,
    });

    if ((dataState is DataSuccess) && (dataState.data != null)) {
      /// change the [AuthProviderState] to home
      _state = AuthProviderState.home;
      notifyListeners();
    } else if (dataState is DataFailed) {
      print('DATA FAILED ERROR ');
      _data.providerData = dataState.exception!.response!.data['message'];
      _state = AuthProviderState.error;
      notifyListeners();
    } else {
      _data.providerData = 'An error occured';
      _state = AuthProviderState.error;
      notifyListeners();
    }
  }

  void logout() {
    _state = AuthProviderState.login;
    clearCacheUseCase();
    notifyListeners();
  }

  void autoLogin() async {
    final bool isCacheEmpty = await checkCacheUseCase();
    if (isCacheEmpty) {
      _state = AuthProviderState.login;
      notifyListeners();
    } else {
      _state = AuthProviderState.home;
      notifyListeners();
    }
  }

  void getProfile() async {
    final signUpModel = await getSavedProfileUseCase();
    _data.providerData = signUpModel;
    notifyListeners();
  }
}
