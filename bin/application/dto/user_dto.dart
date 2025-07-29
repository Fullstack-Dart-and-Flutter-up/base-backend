import '../../domain/models/user_model.dart';

class UserDto {
  static Map toMap(User user) => {
    'name': user.name,
    'lastName': user.lastName,
    'birthday': user.birthday.toIso8601String(),
  };
}
