import 'package:shared_preferences/shared_preferences.dart';
import 'package:veegilbank/features/mobilebank/data/models/signup.dart';

class CacheService {
  final SharedPreferences? prefs;
  CacheService({
    this.prefs,
  });

  Future<void> saveProfile(SignUpModel signUpModel) async {
    Map<String, dynamic> details = signUpModel.toJson();
    // set phoneNumber
    await prefs!.setString('phoneNumber', details['phoneNumber']);
    // set created
    await prefs!.setString('created', details['created']);
  }

  Future<void> clearCache() async {
    await prefs!.clear();
  }

  SignUpModel getSavedProfile() {
    Map<String, dynamic> data = {};
    data['phoneNumber'] = prefs!.getString('phoneNumber');
    data['created'] = prefs!.getString('created');
    return SignUpModel.fromJson(data);
  }

  bool isCacheEmpty() {
    return prefs!.getKeys().isEmpty;
  }
}
