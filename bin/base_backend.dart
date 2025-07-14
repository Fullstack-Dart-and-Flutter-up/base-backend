import 'package:shelf/shelf_io.dart';
import 'package:shelf/shelf.dart';

void main(List<String> arguments) {
  serve(
    (Request req) => Response(
      200,
      body: ' mundo',
      headers: {'content-type': 'application/json'},
    ),
    'localhost',
    8080,
  );
}
