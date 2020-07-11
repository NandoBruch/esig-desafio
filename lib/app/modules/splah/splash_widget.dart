import 'package:flutter/material.dart';

class SplashWidget extends StatefulWidget {
  final Widget child;
  final Widget splash;
  final List<Future> futures;
  final Duration minDuration;
  final void Function(List responses) onFinish;

  const SplashWidget({
    Key key,
    this.child,
    this.futures,
    this.onFinish,
    this.minDuration = const Duration(seconds: 2),
    Widget splash,
  })  : this.splash = splash ??
            const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        super(key: key);

  @override
  _SplshWidgetState createState() => _SplshWidgetState();
}

class _SplshWidgetState extends State<SplashWidget> {
  Future<List> future;

  @override
  void initState() {
    super.initState();

    future = Future.wait(widget.futures + [Future.delayed(widget.minDuration)]);
    future.then((value) {
      if (widget.onFinish != null) widget.onFinish(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return widget.splash;
        } else {
          return widget.child ?? Material();
        }
      },
    );
  }
}
