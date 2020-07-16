import 'package:desafio/app/app_controller.dart';
import 'package:desafio/app/modules/splah/splah_module.dart';
import 'package:desafio/app/repositories/repository.dart';
import 'package:desafio/app/repositories/posts_repository.dart';
import 'package:desafio/app/services/data_service.dart';
import 'package:desafio/app/services/http_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:desafio/app/app_widget.dart';
import 'package:desafio/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Repository(), lazy: false),
        Bind((i) => PostRepository()),
        Bind((i) => HttpService()),
        Bind((i) => DataService())
      ];

  @override
  List<Router> get routers => [
        Router('/', module: SplahModule()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
