import 'package:fluro/fluro.dart';

import '../handlers/home_handler.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  //Home Router
  static String rootRoute = '/';

  static void configureRoutes() {
    router.define(rootRoute, handler: HomeHandler.home, transitionType: TransitionType.none);
    router.notFoundHandler = HomeHandler.home;
  }
}
