import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veegilbank/config/theme/dark_theme.dart';
import 'package:veegilbank/config/theme/light_theme.dart';
// import 'package:veegilbank/features/mobilebank/presentation/pages/auth/auth.dart';
import 'package:sizer/sizer.dart';
import 'package:veegilbank/features/mobilebank/data/data_sources/local/cache_service.dart';
import 'package:veegilbank/features/mobilebank/data/data_sources/remote/bank_api_service.dart';
import 'package:veegilbank/features/mobilebank/data/repository/auth_repository_impl.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/check_cache_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/clear_cache_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/get_saved_profile_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/login_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/save_profile_usecase.dart';
import 'package:veegilbank/features/mobilebank/domain/usecases/signup_usecase.dart';
import 'package:veegilbank/features/mobilebank/presentation/pages/auth/auth.dart';
import 'package:veegilbank/features/mobilebank/presentation/pages/history/history.dart';
import 'package:veegilbank/features/mobilebank/presentation/pages/home/home.dart';
import 'package:veegilbank/features/mobilebank/presentation/pages/profile/profile.dart';
import 'package:veegilbank/features/mobilebank/presentation/pages/settings/settings.dart';
import 'package:veegilbank/features/mobilebank/presentation/pages/success/success.dart';
import 'package:veegilbank/features/mobilebank/presentation/pages/transfer/amount.dart';
import 'package:veegilbank/features/mobilebank/presentation/providers/auth/auth_provider.dart';
import 'package:veegilbank/features/mobilebank/presentation/providers/auth/auth_validation.dart';

import 'config/routes/routes.dart';
import 'features/mobilebank/presentation/pages/transfer/account.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load the shared preferences
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authRepo =
        AuthRepositoryImpl(BankApiService(Dio()), CacheService(prefs: prefs));
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: ((context) => AuthProvider(
                    loginUseCase: LoginUseCase(authRepo),
                    signUpUseCase: SignUpUseCase(authRepo),
                    checkCacheUseCase: CheckCacheUseCase(authRepo),
                    clearCacheUseCase: ClearCacheUseCase(authRepo),
                    getSavedProfileUseCase: GetSavedProfileUseCase(authRepo),
                    saveProfileUseCase: SaveProfileUseCase(authRepo),
                  ))),
          ChangeNotifierProvider(create: ((context) => AuthValidation()))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: lightTheme(),
          themeMode: ThemeMode.system,
          darkTheme: darkThme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: SafeArea(child: AuthPage()),
        ),
      );
    });
  }
}
