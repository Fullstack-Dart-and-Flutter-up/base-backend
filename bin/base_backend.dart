// import 'package:shelf/shelf.dart';
import 'core/database/database_mysql_adapter.dart';
import 'core/database/database.dart';
import 'application/web/UserController.dart';
import 'domain/ports/input/user_service.dart';
import 'domain/ports/input/output/user_repository.dart';
import 'domain/services/user_service_imp.dart';
import 'infrastructure/database/user_repository_imp.dart';
import 'infrastructure/database/mapper.dart';
import 'infrastructure/mappers/user_mapper.dart';

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

  userController.getUsers();
}
