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
    return box.get('token');
  }

  @override
  Future<void> saveToken(String? token) async {
    if (token != null) {
      var box = await _openBox();
      await box.put('token', token);
    }
  }

  @override
  Future<void> deleteToken() async {
    var box = await _openBox();
    await box.delete('token');
  }
}
