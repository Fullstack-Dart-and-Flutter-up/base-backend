// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../domain/models/user_model.dart';

class UserDto extends User {
  final int id;
  final String? password;
  final String? deviceToken;

  UserDto(
    super.name,
    super.lastName,
    super.userscol,
    super.birthday,
    super.status,
    super.document,
    super.email,
    super.city,
    this.id,
    this.password,
    this.deviceToken,
  );

  //TODO: refatorar aqui
  static Map toMap(User user) => {
    'name': user.name,
    'lastName': user.lastName,
    'birthday': user.birthday.toIso8601String(),
  };
}
