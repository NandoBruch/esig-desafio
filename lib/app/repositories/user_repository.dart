import 'package:hive/hive.dart';
import 'models/user_model.dart';

class UserRepository {
  UserModel user;

  Future<bool> init() async {
    try {
      var userBox = await Hive.openBox('user');

      if (userBox.length == 0) {
        print('UserBox vazia');
        user = UserModel();
        userBox.add(user);
      } else {
        print('UserBox já foi inicializada');
        user = userBox.getAt(0) as UserModel;
      }

      return true;
    } catch(e) {
      return false;
    }
  }
}
