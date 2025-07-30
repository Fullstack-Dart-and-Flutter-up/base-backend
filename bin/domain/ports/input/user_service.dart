import '../../models/user_model.dart';

abstract class UserService {
  Future<List<User>> getAllUsers();

  Future<bool> saveUser(User user);
}
