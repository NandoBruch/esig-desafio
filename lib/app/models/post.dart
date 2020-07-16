enum Status { liked, neutral, unliked }

class Post {
  int userId;
  String userName;
  int id;
  String title;
  String body;
  Status status = Status.neutral;

  Post(
      {this.userId,
      this.userName,
      this.id,
      this.title,
      this.body,
      this.status});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['status'] = this.status;
    return data;
  }
}
