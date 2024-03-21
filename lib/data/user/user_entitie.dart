class UserEntity {
   String userId;
   String name;
   String email;
   String password;

  UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserEntity.fromDocument(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
