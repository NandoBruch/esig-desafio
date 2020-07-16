import 'package:desafio/app/models/post.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final int id;
  final String userName;
  final String title;
  final int userId;
  final Function changeRoute;
  final IconButton like;
  final IconButton unlike;
  final Status status;

  CustomCard(
      {Key key,
      @required this.id,
      @required this.userName,
      @required this.title,
      @required this.changeRoute,
      @required this.userId,
      @required this.like,
      @required this.unlike,
      this.status})
      : super(key: key);

  @override
  _CustoCardState createState() => _CustoCardState();
}

class _CustoCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 356,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5,
            color: Colors.black26,
            offset: Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://api.adorable.io/avatars/50/${widget.userId}.png')),
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
                          widget.userName,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Hind',
                          ),
                        ),
                        Text(
                          '${widget.userId} hrs atrás',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.changeRoute,
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: widget.id,
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://picsum.photos/450/200?random=${widget.id}'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    width: MediaQuery.of(context).size.width - 60,
                    child: Text(
                      widget.title,
                      maxLines: 3,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.like,
                  widget.unlike
                  // IconButton(
                  //     icon: Icon(Icons.thumb_up),
                  //     color: widget.status == Status.liked
                  //         ? Colors.green
                  //         : Colors.grey,
                  //     onPressed: widget.like),
                  // IconButton(
                  //     icon: Icon(Icons.thumb_down),
                  //     color: widget.status == Status.unliked
                  //         ? Colors.red
                  //         : Colors.grey,
                  //     onPressed: widget.unlike)
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
