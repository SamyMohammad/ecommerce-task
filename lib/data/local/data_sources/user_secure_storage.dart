import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _instance = FlutterSecureStorage();
  static const _tokenKey = 'token';
  static const _onBoarding = 'onBoarding';

  static Future<void> writeToken({required String value}) async {
    await _instance.write(key: _tokenKey, value: value);
  }

  static Future<String?> readToken() async {
    return await _instance.read(key: _tokenKey);
  }

  static Future<void> delete() async {
    await _instance.delete(key: _tokenKey);
  }
}
