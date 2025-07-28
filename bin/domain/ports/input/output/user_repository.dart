import '../../../models/user_model.dart';

abstract class UserRepository {
  //casos de uso
  Future<List<User>> getUsers();
  bool saveUser(User user);
  User getUserById(int id);
  User getUseryEmail(String email);
  User getUserByName(String name);
}
