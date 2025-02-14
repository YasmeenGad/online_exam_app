import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../contracts/offline_auth_datasource.dart';

@Injectable(as: OfflineAuthDataSource)
class OfflineAuthDataSourceImpl implements OfflineAuthDataSource {
  final String _boxName = 'userToken';

  Future<Box> _openBox() async {
    return Hive.openBox(_boxName);
  }

  @override
  Future<String?> getToken() async {
    var box = await _openBox();
    final token = box.get('token');
    debugPrint('Token retrieved: $token');
    return token;
  }
  @override
  Future<void> saveToken(String? token) async {
    if (token != null) {
      var box = await _openBox();
      await box.put('token', token);
      debugPrint('Token saved: $token');
    }
  }

  @override
  Future<void> deleteToken() async {
    var box = await _openBox();
    await box.delete('token');
    debugPrint('Token deleted');
  }
}
