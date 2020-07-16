import 'package:desafio/app/models/post.dart';
import 'package:desafio/app/repositories/posts_repository.dart';
import 'package:desafio/app/services/data_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'feed_controller.g.dart';

class FeedController = _FeedControllerBase with _$FeedController;

abstract class _FeedControllerBase with Store {
  DataService ds = Modular.get();
  PostRepository ps = Modular.get();

  // ========================================================================

  // OBS: A linhas comentadas abaixo são um teste de persistência que tentei
  // fazer com o banco de dados Hive. Acabou não dando certo pois o hive não
  // aceita registros de tipagem que não seja nativa, estou deixando os testes
  // comentados pois pretendo insistir nele em um outro momento

  // ========================================================================

  @observable
  var posts = ObservableList<dynamic>();

  _FeedControllerBase() {
    getPosts();
  }

  @observable
  bool rate = true;

  getPosts() async {
    // if (ps.post.posts == null) {
    var res = await ds.getPosts();
    res.data.forEach((r) async {
      var res = await ds.getUser(id: r['userId']);
      this.posts.add(
            Post(
              userId: r['userId'],
              userName: res.data['name'],
              id: r['id'],
              title: r['title'],
              body: r['body'],
              status: Status.neutral,
            ),
          );
      // ps.post.posts = this.posts;
      // ps.post.save();
    });
    this.posts.shuffle();
    // } else
    // this.posts = ps.post.posts;
  }

  @action
  like(id) {
    var index = posts.indexWhere((e) => e.id == id);
    if (posts[index].status == Status.liked) {
      posts[index].status = Status.neutral;
      // ps.post.posts[index].status = Status.neutral;
    } else {
      posts[index].status = Status.liked;
      // ps.post.posts[index].status = Status.liked;
    }
    // ps.post.save();
  }

  @action
  unlike(id) {
    var index = posts.indexWhere((e) => e.id == id);
    if (posts[index].status == Status.unliked) {
      posts[index].status = Status.neutral;
      // ps.post.posts[index].status = Status.neutral;
    } else {
      posts[index].status = Status.unliked;
      // ps.post.posts[index].status = Status.unliked;
    }
    // ps.post.save();
  }
}
