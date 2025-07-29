import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../dto/user_dto.dart';
import '../../domain/models/user_model.dart';

import '../../domain/ports/input/user_service.dart';

class Usercontroller {
  final UserService _usersServices;

  Usercontroller(this._usersServices);

  Handler getHandler({List<Middleware>? middleware, bool isSecurity = false}) {
    final Router router = Router();

    router.get('/users', (Request req) async {
      //logica da api - listar os usuarios em formato json
      List<User> users = await _usersServices.getAllUsers();
      //cfazendo o mapeameto dos usuarios para json
      List<Map> userMap = users.map((user) => UserDto.toMap(user)).toList();
      return Response.ok(
        jsonEncode(userMap),
        headers: {'content-type': 'application/json'},
      );
    });

    return createHandler(
      router: router,
      middleware: middleware,
      isSecurity: isSecurity,
    );
  }
}
