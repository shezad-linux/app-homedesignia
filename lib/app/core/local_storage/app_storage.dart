import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_storage.g.dart';

class AppStorage {
  // SharedPreferences? _box;
  final _type = 'type';
  final _isShop = 'shop';
  final _tokenKey = 'token';
  final _refreshTokenKey = 'refreshToken';

  /// for initialling app local storage
  Future<void> initAppStorage() async {
    // await SharedPreferences.getInstance();
    // _box = await SharedPreferences.getInstance();
  }

  Future<String?> getType() async {
    final _box = await SharedPreferences.getInstance();
    return _box.getString(_type);
  }

  Future<String?> getToken() async {
    final _box = await SharedPreferences.getInstance();
    return _box.getString(_tokenKey);
  }

  Future<bool?> getIsShop() async {
    final _box = await SharedPreferences.getInstance();
    return _box.getBool(_isShop);
  }

  Future<void> putType(String type) async {
    final _box = await SharedPreferences.getInstance();
    await _box.setString(_type, type);
  }

  Future<void> putToken(String token) async {
    final _box = await SharedPreferences.getInstance();
    await _box.setString(_tokenKey, token);
  }

  Future<String?> getRefreshToken() async {
    final _box = await SharedPreferences.getInstance();
    return _box.getString(_refreshTokenKey);
  }

  Future<void> putRefreshToken(String token) async {
    final _box = await SharedPreferences.getInstance();
    await _box.setString(_refreshTokenKey, token);
  }

  Future<void> putIsShop(bool isShop) async {
    final _box = await SharedPreferences.getInstance();
    await _box.setBool(_isShop, isShop);
  }

  /// for clearing all data in box
  Future<void> clearAllData() async {
    final _box = await SharedPreferences.getInstance();
    await _box.clear();
  }
}

@riverpod
AppStorage appStorage(AppStorageRef ref) => AppStorage();
