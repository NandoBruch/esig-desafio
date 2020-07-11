import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'splash_widget.dart';
import '../../app_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppController controller = Modular.get();
    return SplashWidget(
      futures: [controller.initApp()],
      splash: Container(),
    );
  }
}
