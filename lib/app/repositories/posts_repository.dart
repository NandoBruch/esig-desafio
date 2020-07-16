import 'package:hive/hive.dart';
import 'models/post_model.dart';

class PostRepository {
  PostModel post;

  Future<bool> init() async {
    try {
      Hive.deleteBoxFromDisk('post');
      var userBox = await Hive.openBox('post');

      if (userBox.length == 0) {
        print('UserBox vazia');
        post = PostModel();
        userBox.add(post);
      } else {
        print('UserBox já foi inicializada');
        post = userBox.getAt(0) as PostModel;
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
