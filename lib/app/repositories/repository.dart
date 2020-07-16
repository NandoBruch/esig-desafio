import 'package:hive/hive.dart';

import 'models/post_model.dart';

class Repository {
  Repository() {
    _init();
  }

  Future<bool> _init() async {
    Hive.registerAdapter(PostModelAdapter());

    return true;
  }
}
