import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage();
  static const String _refreshToken = 'refresh_token';
  static const String _accessToken = 'access_token';
  static const String _userid = 'user_id';
  static const String _userEmailId = 'user_email';

  static String get accessTokenKey => _accessToken;
  static String get refreshTokenKey => _refreshToken;

  static String get userIdKey => _userid;

  static String get userEmailId => _userEmailId;

  static Future<String?> getaccessToken() async {
    String? value = await storage.read(key: _accessToken);
    return value;
  }
  static Future<String?> getRefreshToken() async {
    String? value = await storage.read(key: _refreshToken);
    return value;
  }

  static Future<String?> getUserId() async {
    String? value = await storage.read(key: userIdKey);
    return value;
  }

  static Future<String?> getUserEmailId() async {
    String? value = await storage.read(key: userEmailId);
    return value;
  }

  static writeUserId(String userIdValue) async {
    await storage.write(key: _userid, value: userIdValue);
  }

  static writeRefreshToken(String refreshToken) async {
    await storage.write(key: _refreshToken, value: refreshToken);
  }

  static writeAccessToken(String accessTokenValue) async {
    await storage.write(key: _accessToken, value: accessTokenValue);
  }

  static writeUserEmailId(String userEmailIdValue) async {
    await storage.write(key: _userEmailId, value: userEmailIdValue);
  }

  static Future<void> deleteStoredValues() async {
    await storage.deleteAll().then((value) => log("deleted values of storage"));
  }
}
