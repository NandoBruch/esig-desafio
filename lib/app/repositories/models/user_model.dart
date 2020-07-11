import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  @HiveField(4)
  String image;
  @HiveField(5)
  String birth;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.image,
    this.birth,
  });
}
