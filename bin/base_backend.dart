// import 'package:shelf/shelf_io.dart';
// import 'package:shelf/shelf.dart';
import 'package:commons_core/commons_core.dart';

void main(List<String> arguments) async {
  await CustomEnv.fromFile('.env');
  var result = await CustomEnv.get<String>(key: 'chave');
  print(result);
  // serve(
  //   (Request req) => Response(
  //     200,
  //     body: ' mundo',
  //     headers: {'content-type': 'application/json'},
  //   ),
  //   'localhost',
  //   8080,
  // );
}
