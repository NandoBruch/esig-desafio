import 'package:desafio/app/modules/home/post/post_controller.dart';
import 'package:desafio/app/modules/home/feed/feed_controller.dart';
import 'package:desafio/app/modules/home/home_controller.dart';
import 'package:desafio/app/modules/home/post/post_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafio/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PostController()),
        Bind((i) => FeedController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AppMainPage()),
        Router(
          '/post',
          child: (_, args) => PostPage(post: args.data),
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
