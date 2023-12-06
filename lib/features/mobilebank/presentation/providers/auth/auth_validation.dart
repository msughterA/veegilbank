import 'package:flutter/material.dart';
import '../../../data/models/validation.dart';

class AuthValidation with ChangeNotifier {
  ValidationItem _phoneNumber = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

//Getters
  ValidationItem get phoneNumber => _phoneNumber;
  ValidationItem get password => _password;

  bool get isValid {
    if (_phoneNumber.value != null && password.value != null) {
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  void empty() {
    _phoneNumber = ValidationItem(null, 'Must be filled');
    _password = ValidationItem(null, 'Must be filled');
    notifyListeners();
  }

  void clear() {
    _phoneNumber = ValidationItem(null, null);
    _password = ValidationItem(null, null);
    notifyListeners();
  }

//Setters
  void changePhoneNumber(String value) {
    if (value.length == 11) {
      _phoneNumber = ValidationItem(value, null);
    } else {
      _phoneNumber = ValidationItem(null, "Must be 11 characters");
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 6 && value.length <= 8) {
      _password = ValidationItem(value, null);
    } else {
      _password = ValidationItem(null, "Must be between 6 and 8 characters");
    }
    notifyListeners();
  }
}
