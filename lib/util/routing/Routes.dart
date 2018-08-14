import 'package:fluro/fluro.dart';

import 'package:morii/util/routing/handlers.dart';

class Routes {

  static void configureRoutes(Router router) {
    router.define("/", handler: personalTLHandler); // TODO: This should be PersonalTimeline if logged in, else SignIn
    router.define("/local", handler: localTLHandler);
  }
}