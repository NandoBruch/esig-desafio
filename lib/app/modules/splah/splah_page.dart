import 'package:desafio/app/app_theme.dart';
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
      splash: Scaffold(
        body: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2,
                    color: AppTheme.terciaryColor),
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2,
                    color: AppTheme.quaternaryColor)
              ],
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 200,
              ),
            )
          ],
        ),
      ),
      onFinish: (_) => Modular.to.pushReplacementNamed(controller.rootPath),
    );
  }
}
