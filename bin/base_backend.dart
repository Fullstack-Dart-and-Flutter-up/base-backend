// import 'package:shelf/shelf.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'core/database/database_mysql_adapter.dart';
import 'core/database/database.dart';
import 'application/web/UserController.dart';
import 'domain/ports/input/user_service.dart';
import 'domain/ports/input/output/user_repository.dart';
import 'domain/services/user_service_imp.dart';
import 'infrastructure/database/user_repository_imp.dart';
import 'infrastructure/database/mapper.dart';
import 'infrastructure/mappers/user_mapper.dart';
import 'package:commons_core/commons_core.dart';
import 'application/dto/user_dto.dart';

void main(List<String> arguments) async {
  //CustomEnv.fromFile('.env');
  // var result = await CustomEnv.get<String>(key: 'chave');
  // print(result);

  // print(await DatabaseMysqlAdapter().query('select * from tb_permissions'));

  // await serve(
  //   (Request req) => Response(
  //     200,
  //     body: 'Ola mundo',
  //     headers: {'content-type': 'application/json'},
  //   ),
  //   'localhost',
  //   8080,
  // );
  final Mapper _userMapper = UserMapper();
  final Database database = DatabaseMysqlAdapter();
  final UserRepository userRepository = UserRepositoryImp(
    database,
    _userMapper,
  );
  final UserService usersServices = UserServiceImp(userRepository);
  final Usercontroller userController = Usercontroller(usersServices);

  usersServices
      .saveUser(
        UserDto(
          //teoricamente usr esses valores aqui nao é necessario
          'Luana',
          'Silva',
          '12345',
          DateTime(1990, 1, 1),
          'active',
          '1234',
          'email@gmail',
          'Sao Paulo',
          1,
          'passowrd123',
          'token1234',
        ),
      )
      .then((value) => print(value));

  var cascadeHandler = Cascade().add(userController.getHandler()).handler;
  var handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(cascadeHandler);

  shelf_io.serve(
    handler,
    await CustomEnv.get<String>(key: 'server_ip'),
    await CustomEnv.get<int>(key: 'server_port'),
  );
  // Inicia o servidor na porta 8080
  // var server = await serve(handler, 'localhost', 8080);
  // print('Servidor rodando em http://${server.address.host}:${server.port}');
}
