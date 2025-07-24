// import 'package:shelf/shelf.dart';
import 'package:commons_core/commons_core.dart';
import 'core/database/database_mysql_adapter.dart';

void main(List<String> arguments) async {
  CustomEnv.fromFile('.env');
  var result = await CustomEnv.get<String>(key: 'chave');
  print(result);

  print(await DatabaseMysqlAdapter().query('select * from tb_permissions'));

  // await serve(
  //   (Request req) => Response(
  //     200,
  //     body: 'Ola mundo',
  //     headers: {'content-type': 'application/json'},
  //   ),
  //   'localhost',
  //   8080,
  // );
}
