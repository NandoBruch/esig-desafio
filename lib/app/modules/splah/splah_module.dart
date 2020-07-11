import 'package:desafio/app/modules/splah/splah_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplahModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
      ];

  static Inject get to => Inject<SplahModule>.of();
}
