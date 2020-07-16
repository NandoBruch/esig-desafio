import 'package:flutter_modular/flutter_modular.dart';
import 'repositories/posts_repository.dart';

class AppController {
  var rootPath = '/home';

  Future<bool> initApp() async {
    PostRepository userRepository = Modular.get();

    await Future.wait([
      userRepository.init(),
      Future.delayed(Duration(seconds: 1)),
    ]);

    return true;
  }
}
