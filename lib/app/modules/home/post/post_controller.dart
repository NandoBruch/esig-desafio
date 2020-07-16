import 'package:desafio/app/services/data_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'post_controller.g.dart';

class PostController = _PostControllerBase with _$PostController;

abstract class _PostControllerBase with Store {
  DataService ds = Modular.get();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
