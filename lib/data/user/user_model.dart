import 'package:provider_counter/data/user/user_entitie.dart';

class UserModel {
   String userId;
   String name;
   String email;
   String password;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
  });

 UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      name: name,
      email: email,
      password: password,
    );
  }

  static UserModel fromEntity(UserEntity entity) {
    return UserModel(
      userId: entity.userId,
      name: entity.name,
      email: entity.email,
      password: entity.password,
    );
  }

  static final empty = UserModel(
    userId: '',
    name: '',
    email: '',
    password: '',
  );


}