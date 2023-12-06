abstract class TokenRepository {
  /// Method to save the [TokenEntity] to shared preferences
  Future<void> saveToken();
}
