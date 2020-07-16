import 'package:desafio/app/app_theme.dart';
import 'package:desafio/app/components/Card.dart';
import 'package:desafio/app/models/post.dart';
import 'package:desafio/app/modules/home/feed/feed_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FeedPage extends StatefulWidget {
  final String title;
  const FeedPage({Key key, this.title = "Feed"}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends ModularState<FeedPage, FeedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          Icon(
            Icons.notifications,
            size: 30,
            color: AppTheme.primaryColor,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.more_horiz,
            size: 30,
            color: AppTheme.primaryColor,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        leading: Icon(
          Icons.add,
          size: 30,
          color: AppTheme.primaryColor,
        ),
        title: Text(
          'Feed',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),

      //BodySection
      body: Observer(
        builder: (_) => controller.posts.length == 0
            ? Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(),
                ),
              )
            : Observer(
                builder: (_) => controller.rate == true
                    ? ListView.builder(
                        itemCount: controller.posts.length,
                        itemBuilder: (context, index) => CustomCard(
                          id: controller.posts[index].id,
                          userName: controller.posts[index].userName,
                          title: controller.posts[index].title,
                          userId: controller.posts[index].userId,
                          status: controller.posts[index].status,
                          changeRoute: () {
                            Modular.to.pushNamed('/home/post',
                                arguments: controller.posts[index]);
                          },
                          like: IconButton(
                              icon: Icon(Icons.thumb_up),
                              color:
                                  controller.posts[index].status == Status.liked
                                      ? Colors.green
                                      : Colors.grey,
                              onPressed: () {
                                controller.rate = true;
                                controller.like(controller.posts[index].id);
                              }),
                          unlike: IconButton(
                              icon: Icon(Icons.thumb_down),
                              color: controller.posts[index].status ==
                                      Status.unliked
                                  ? Colors.red
                                  : Colors.grey,
                              onPressed: () {
                                controller.rate = true;
                                controller.unlike(controller.posts[index].id);
                              }),
                        ),
                      )
                    : Container()),
      ),
    );
  }
}
