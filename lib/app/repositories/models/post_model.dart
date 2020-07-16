import 'package:hive/hive.dart';

part 'post_model.g.dart';

@HiveType(typeId: 0)
class PostModel extends HiveObject {
  @HiveField(0)
  List<dynamic> posts;

  PostModel({
    this.posts,
  });
}
