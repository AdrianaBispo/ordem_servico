import '../../dto/entities/user_entity.dart';

class UserDto extends UserEntity {
  String? login;
  String? password;

  UserDto({
    required this.login,
    required this.password,
  }) : super(
          login: login,
          password: password,
        );

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
    };
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      login: json['login'],
      password: json['password'],
    );
  }
}
