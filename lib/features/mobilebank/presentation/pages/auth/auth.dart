import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:veegilbank/features/mobilebank/presentation/providers/auth/auth_provider.dart';
import 'package:veegilbank/features/mobilebank/presentation/providers/auth/auth_provider_state.dart';
import 'package:veegilbank/features/mobilebank/presentation/providers/auth/auth_validation.dart';
import 'package:floating_snackbar/floating_snackbar.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final validationService = Provider.of<AuthValidation>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          width: 100.w,
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10.h,
                width: 10.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle),
                child: const Center(
                  child: Text(
                    'V',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const Padding(
                padding: EdgeInsets.zero,
                child: Text(
                  'VeegilBank',
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _buildtitle(authProvider),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                    label: const Text('Phone Number'),
                    errorText: validationService.phoneNumber.error,
                    prefixIcon: const Icon(Icons.phone_android_outlined)),
                onChanged: (value) {
                  validationService.changePhoneNumber(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    label: const Text('Password'),
                    errorText: validationService.password.error,
                    prefixIcon: const Icon(Icons.password_outlined)),
                onChanged: (value) {
                  validationService.changePassword(value);
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              _authSwitch(authProvider, validationService),
              _buildButton(authProvider, validationService, context)
            ],
          ),
        ),
      ),
    );
  }

  String _buildtitle(AuthProvider provider) {
    if (provider.state == AuthProviderState.signUp) {
      return 'SignUp';
    } else if (provider.state == AuthProviderState.login) {
      return 'Login';
    }
    return 'Login';
  }

  Widget _authSwitch(AuthProvider provider, AuthValidation authValidation) {
    if (provider.state == AuthProviderState.signUp) {
      return Row(
        children: [
          const Text("Already have an account?"),
          TextButton(
              onPressed: () {
                // Do something
                provider.goToLogin();
                _passwordController.text = '';
                _phoneNumberController.text = '';
                authValidation.clear();
              },
              child: Text('Login'))
        ],
      );
    } else if (provider.state == AuthProviderState.login) {
      return Row(
        children: [
          const Text("Don't have an account?"),
          TextButton(
              onPressed: () {
                // Do something
                provider.goToSignUp();
                _passwordController.text = '';
                _phoneNumberController.text = '';
                authValidation.clear();
              },
              child: Text('SignUp'))
        ],
      );
    }
    return Row(
      children: [
        const Text("Don't have an account?"),
        TextButton(
            onPressed: () {
              // Do something
            },
            child: Text('SignUp'))
      ],
    );
  }

  Widget _buildButton(
      AuthProvider provider, AuthValidation authValidation, context) {
    if (provider.state == AuthProviderState.signUp) {
      return _signUp(
        authValidation,
        provider,
        context,
      );
    } else if (provider.state == AuthProviderState.login) {
      return _login(
        authValidation,
        provider,
        context,
      );
    }
    return Container();
  }
}

_signUp(
  AuthValidation authValidation,
  AuthProvider provider,
  context,
) {
  //provider.login(phoneNumber, password);
  return Consumer<AuthProvider>(
    builder: (context, value, child) {
      if (value.state == AuthProviderState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (value.state == AuthProviderState.error) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Code inside this block will be executed after the frame is rendered
          FloatingSnackBar(
            message: provider.data.providerData as String,
            context: context,
            duration: const Duration(milliseconds: 4000),
          );
          value.state = AuthProviderState.login;
        });
      } else if (value.state == AuthProviderState.home) {
        {
          Navigator.pushReplacementNamed(context, '/');
        }
      }
      return AuthButton(
        onPressed: () {
          if (authValidation.isValid) {
            provider.signUp(authValidation.phoneNumber.value!,
                authValidation.password.value!);
          } else {
            authValidation.empty();
          }
        },
        text: 'SignUp',
      );
    },
  );
}

_login(
  AuthValidation authValidation,
  AuthProvider provider,
  context,
) {
  //provider.login(phoneNumber, password);
  return Consumer<AuthProvider>(
    builder: (context, value, child) {
      if (value.state == AuthProviderState.loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (value.state == AuthProviderState.error) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Code inside this block will be executed after the frame is rendered
          FloatingSnackBar(
            message: provider.data.providerData as String,
            context: context,
            duration: const Duration(milliseconds: 4000),
          );
          value.state = AuthProviderState.login;
        });
      } else if (value.state == AuthProviderState.home) {
        {
          Navigator.pushReplacementNamed(context, '/');
        }
      }
      return AuthButton(
        onPressed: () {
          if (authValidation.isValid) {
            provider.login(authValidation.phoneNumber.value!,
                authValidation.password.value!);
          } else {
            authValidation.empty();
          }
        },
        text: 'Login',
      );
    },
  );
}

class AuthButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  const AuthButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(5.h),
      ),
    );
  }
}
