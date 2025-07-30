import '../../domain/models/user_model.dart';
import '../database/mapper.dart';

class UserMapper implements Mapper<User> {
  User toDamin(Map map) => User(
    map['name'],
    map['lastName'],
    map['userscol'],
    map['birthday'],
    map['status'],
    map['document'],
    map['email'],
    map['city'],
  );

  @override
  User toDomain(Map map) {
    // TODO: implement toDomain
    throw UnimplementedError();
  }
}
