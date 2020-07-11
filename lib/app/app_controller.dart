import 'package:flutter_modular/flutter_modular.dart';
import 'repositories/user_repository.dart';

class AppController {
  var rootPath = '/';

  Future<bool> initApp() async {
    UserRepository userRepository = Modular.get();

    await Future.wait([
      userRepository.init(),
      Future.delayed(Duration(seconds: 1)),
    ]);

    return true;
  }
}
