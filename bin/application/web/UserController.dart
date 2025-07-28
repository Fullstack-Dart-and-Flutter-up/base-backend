import '../../domain/ports/input/user_service.dart';

class Usercontroller {
  final UserService _usersServices;

  Usercontroller(UserService usersServices) : _usersServices = usersServices;

  getUsers() {
    _usersServices.getAllUsers().then((value) => value.forEach(print));
  }
}
