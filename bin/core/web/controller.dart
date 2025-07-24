import 'package:shelf/shelf.dart';
import '../../../packages/lib/commons/commons-core/lib/commons_core.dart';
import '../security/security_service.dart';

abstract class Controller {
  Handler getHandler({List<Middleware>? middleware, bool isSecurity = false});

  Handler createHandler({
    //recebe handler e pode ou nao receber uma lista de middles
    required Handler router,
    List<Middleware>? middleware,
    bool isSecurity = false,
  }) {
    //caso a lista seja nula atribuo lista vazia
    middleware ??= [];
    if (isSecurity) {
      var securityService = DependencyInjector().get<SecurityService>();

      middleware.addAll([
        securityService.authorization,
        securityService.verifyJwt,
      ]);
    }

    //objeto de pipeline q pode conter varios midles
    //sequencia de instrucoes realizadas em cima da rota
    var pipe = Pipeline();

    //adicionando os headers na pipeline
    //terar sobre a lista e adiciono o midle na pipe e atribuo o valor da midle na pipe
    for (var m in middleware) {
      pipe.addMiddleware(m);
    }
    return pipe.addHandler(router);
  }
}
