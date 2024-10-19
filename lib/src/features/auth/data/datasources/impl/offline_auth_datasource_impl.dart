import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../contracts/offline_auth_datasource.dart';
@Injectable(as: OfflineAuthDataSource)

class OfflineAuthDataSourceImpl implements OfflineAuthDataSource {

  @override
  Future<String> getToken() async{
    var box = await Hive.openBox('userToken');
    return box.get('token');
  }


  @override

    Future<void> saveToken(String? token) async {
      if (token != null) {
        var box = await Hive.openBox('userToken');
        await box.put('token', token);
      }

  }




}