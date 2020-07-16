import 'package:desafio/app/models/post.dart';
import 'package:desafio/app/modules/home/post/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PostPage extends StatefulWidget {
  final String title;
  final Post post;
  const PostPage({Key key, @required this.post, this.title = "Post"})
      : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends ModularState<PostPage, PostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: widget.post.id,
                      child: Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://picsum.photos/450/200?random=${widget.post.id}'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Modular.to.pop(),
                        iconSize: 35,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://api.adorable.io/avatars/50/${widget.post.userId}.png')),
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.post.userName,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'poppins',
                        ),
                      ),
                      Text(
                        '${widget.post.userId} hrs atrás',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    widget.post.title,
                    maxLines: 4,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    widget.post.body,
                    maxLines: 7,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  widget.post.status == Status.neutral
                      ? Container()
                      : widget.post.status == Status.liked
                          ? Icon(
                              Icons.thumb_up,
                              size: 40,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.thumb_down,
                              size: 40,
                              color: Colors.red,
                            )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
