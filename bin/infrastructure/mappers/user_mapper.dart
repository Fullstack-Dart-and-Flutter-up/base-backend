import '../../domain/models/user_model.dart';
import '../database/mapper.dart';

class UserMapper implements Mapper<User> {
  User toDamin(Map map) => User(
    id: map['id'],
    name: map['name'],
    lastName: map['lastName'],
    birthday: map['birthday'],
    status: map['status'],
    document: map['document'],
    email: map['email'],
    city: map['city'],
  );

  @override
  User toDomain(Map map) {
    // TODO: implement toDomain
    throw UnimplementedError();
  }
}
