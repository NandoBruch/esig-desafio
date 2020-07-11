import 'package:hive/hive.dart';

import 'models/user_model.dart';

class Repository {
  Repository() {
    _init();
  }

  Future<bool> _init() async {
    Hive.registerAdapter(UserModelAdapter());   

    return true;
  }
}