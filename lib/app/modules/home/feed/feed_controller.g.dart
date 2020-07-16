// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedController on _FeedControllerBase, Store {
  final _$postsAtom = Atom(name: '_FeedControllerBase.posts');

  @override
  ObservableList<dynamic> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<dynamic> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$rateAtom = Atom(name: '_FeedControllerBase.rate');

  @override
  bool get rate {
    _$rateAtom.reportRead();
    return super.rate;
  }

  @override
  set rate(bool value) {
    _$rateAtom.reportWrite(value, super.rate, () {
      super.rate = value;
    });
  }

  final _$_FeedControllerBaseActionController =
      ActionController(name: '_FeedControllerBase');

  @override
  dynamic like(dynamic id) {
    final _$actionInfo = _$_FeedControllerBaseActionController.startAction(
        name: '_FeedControllerBase.like');
    try {
      return super.like(id);
    } finally {
      _$_FeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic unlike(dynamic id) {
    final _$actionInfo = _$_FeedControllerBaseActionController.startAction(
        name: '_FeedControllerBase.unlike');
    try {
      return super.unlike(id);
    } finally {
      _$_FeedControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts},
rate: ${rate}
    ''';
  }
}
