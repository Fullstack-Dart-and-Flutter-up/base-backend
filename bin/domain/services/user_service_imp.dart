import '../models/user_model.dart';
import '../ports/input/user_service.dart';
import '../ports/input/output/user_repository.dart';

class UserServiceImp implements UserService {
  //injetando porta de saida-output
  final UserRepository _userRepository;

  UserServiceImp(UserRepository userRepository)
    : _userRepository = userRepository;

  @override
  Future<List<User>> getAllUsers() async {
    return await _userRepository.getUsers();
  }
}
